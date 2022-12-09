//
//  ZhuyinViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 5/11/22.
//

import Foundation
import Combine
import CoreBopomofoStudio

@MainActor
class ZhuyinViewModel: ObservableObject, Identifiable {
    
    let contentStore: ContentStore
    let topic: TopicModel
    private let analytics: AnalyticsProvider
    private let letters = NSCharacterSet.letters
    private var cancellables = Set<AnyCancellable>()
    
    @Published var timer: Double
    @Published var showResults = false
    @Published var scorePercentage: Double?
    @Published var isLoadingData = false
    @Published var randomSymbol = ""
    @Published var randomSymbolExample = ""
    @Published var score = 0
    @Published var showPronunciation = false
    @Published var inputSymbol: String = "" {
        didSet {
            checkUserInput()
        }
    }
    private var errorCounter = 0 {
        willSet {
            showPronunciation = newValue >= 3
        }
    }
    private var symbolKey: String {
        if LanguageHelper.isZhuyinOrPinyin(randomSymbol) {
            return Constants.bpmf.contains(randomSymbol) ? randomSymbol : LanguageHelper.convertPinyin(randomSymbol) ?? ""
        } else {
            return randomSymbolExample
        }
    }
    
    init(
        topic: TopicModel,
        contentStore: ContentStore,
        analytics: AnalyticsProvider
    ) {
        self.topic = topic
        self.contentStore = contentStore
        self.analytics = analytics
        self.inputSymbol = ""
        self.timer = contentStore.timerValue
        let randomNumber = Int.random(in: 0...topic.vocabulary.count-1)
        self.randomSymbol = topic.vocabulary[randomNumber].character
        randomSymbolExample = topic.vocabulary[randomNumber].pronunciation
        
        playSound(symbol: randomSymbol)
        addSubscribers()
    }
        
    private func addSubscribers() {
        $timer
            .first(where: { $0 <= 0 })
            .sink { [weak self] time in
                self?.testDidFinish()
            }
            .store(in: &cancellables)
    }
    
    private func generateNewSymbol() {
        let randomNumber = Int.random(in: 0...topic.vocabulary.count-1)
        randomSymbol = topic.vocabulary[randomNumber].character
        randomSymbolExample = topic.vocabulary[randomNumber].pronunciation
        
        playSound(symbol: randomSymbol)
    }
    
    private func playSound(symbol: String) {
        if contentStore.pronunciationVoiceMode {
            if LanguageHelper.isZhuyinOrPinyin(symbol) {
                let sound = Constants.bpmf.contains(symbol) ? symbol : LanguageHelper.convertPinyin(symbol) ?? ""
                
                switch contentStore.voiceSelection {
                case .male:
                    SoundManager.instance.playMaleSound(sound: sound)
                case .female:
                    SoundManager.instance.playFemaleSound(sound: sound)
                }
            } else {
                SoundManager.instance.utterSound(
                    sound: symbol,
                    rate: contentStore.speakingSpeed
                )
            }
        }
    }
    
    private func checkUserInput() {
        guard inputSymbol != "", randomSymbol != "" else { return }
        print("checking", randomSymbol, inputSymbol)
        if inputSymbol == symbolKey {
            score += 1
            generateNewSymbol()
            inputSymbol = ""
            errorCounter = 0
        } else {
            errorCounter += 1
        }
        
        if LanguageHelper.isZhuyinOrPinyin(symbolKey) {
            inputSymbol = ""
        }
    }
    
    private func testDidFinish() {
        self.showResults = true
        if self.score > 0 {
            handleScore()
        }
        ReviewManager.shared.updateSessionsCompleted()
    }
    
    private func handleScore() {
        Task {
            let score = ScoreModel(
                score: self.score,
                time: self.contentStore.timerValue
            )
            
            try await self.contentStore.saveScore(topic: topic, scoreModel: score)
            let scores = try await self.contentStore.fetchScores(topic: topic, scoreModel: score)
            self.scorePercentage = calculateScorePercentageStanding(scores: scores)
        }
        
        if score > UserDefaults.standard.integer(forKey: topic.topicName) {
            UserDefaults.standard.set(score, forKey: topic.topicName)
        }
    }
    
    private func calculateScorePercentageStanding(scores: [ScoreModel]) -> Double? {
        let totalCount = scores.count
        let sortedScores = scores.sorted(by: { $1.score >= $0.score })
        let userPosition = sortedScores.lastIndex(where: { $0.score == score })

        guard let userPosition else { return nil }
        let scorePercentage = Double(userPosition) / Double(totalCount) * 100
        return scorePercentage
    }
    
    func trackEvent(event: AnalyticsProvider.TestAnalyticEvent) {
        self.analytics.track(event: .test(event: event))
    }
}
