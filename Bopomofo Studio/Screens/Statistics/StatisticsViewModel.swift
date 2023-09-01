//
//  StatisticsViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 8/29/23.
//

import Foundation
import CoreBopomofoStudio
import Combine

@MainActor
final class StatisticsViewModel: ObservableObject {
    private let contentStore: ContentStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published private(set) var categoryModels: [CategoryModel]?
    @Published private(set) var topicScores: [TopicModel: Double]?
    @Published var timerValue: Double = 30.0
    @Published var pronunciationAssistance: Bool = false
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        contentStore.$heroContent
            .combineLatest(contentStore.$homeCategoryContent)
            .sink { (heroContent, homeCategoryContent) in
                var newArray: [CategoryModel] = []
                if let heroContent {
                    newArray.append(contentsOf: heroContent)
                }
                if let homeCategoryContent {
                    newArray.append(contentsOf: homeCategoryContent)
                }
                self.categoryModels = newArray
            }
            .store(in: &self.cancellables)
        
        $timerValue
            .combineLatest($pronunciationAssistance)
            .debounce(for: 2, scheduler: DispatchQueue.main)
            .sink { [weak self] (_, _) in
                guard let self else { return }
                Task {
                    await self.calculateScorePercentages()
                }
            }
            .store(in: &self.cancellables)
    }
    
    private func fetchScore(for topic: TopicModel) async {
        do {
            let score = UserDefaults.standard.integer(forKey: topic.topicName)
            let scoreModel = ScoreModel(score: score, time: self.timerValue)
            let scores = try await self.contentStore.fetchScores(
                topic: topic,
                scoreModel: scoreModel,
                textAssistance: self.pronunciationAssistance
            )
            if topicScores == nil {
                self.topicScores = [:]
            }
            guard let scorePercentage = calculateScorePercentageStanding(
                score: score,
                scores: scores
            ) else { return }
            
            self.topicScores?[topic] = scorePercentage

        } catch {
            print("Error to fetch score")
        }
    }
    
    private func calculateScorePercentageStanding(score: Int, scores: [ScoreModel]) -> Double? {
        let totalCount = scores.count
        let sortedScores = scores.sorted(by: { $1.score >= $0.score })
        let userPosition = sortedScores.lastIndex(where: { $0.score == score }) ?? 0

        if totalCount == 0 {
            return nil
        }
        let scorePercentage = Double(userPosition) / Double(totalCount) * 100
        return scorePercentage
    }
    
    func calculateScorePercentages() async {
        await withTaskGroup(of: Void.self) { group in
            if let categoryModels {
                for category in categoryModels {
                    for topic in category.topicList {
                        group.addTask {
                            await self.fetchScore(for: topic)
                        }
                    }
                }
            }
        }
    }
    
    func resetValues() {
        self.topicScores = nil
    }
}
