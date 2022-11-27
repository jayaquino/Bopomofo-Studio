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
    let symbolList: [String]
    let symbolPronunciation: [String]
    private let analytics: AnalyticsProvider
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var timer: Double
    @Published var testFinished = false
    @Published var scorePercentage: Double?
    @Published var isLoadingData = false
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider,
        symbolList: [String],
        symbolPronunciation: [String]
    ) {
        self.contentStore = contentStore
        self.analytics = analytics
        self.symbolList = symbolList
        self.symbolPronunciation = symbolPronunciation
        self.inputSymbol = ""
        self.timer = contentStore.timerValue
        let randomNumber = Int.random(in: 0...symbolList.count-1)
        self.randomSymbol = symbolList[randomNumber]
        displaySymbol = symbolList[randomNumber]
        randomSymbolExample = symbolPronunciation[randomNumber]
     
        
        addSubscribers()
    }
    
    @Published var randomSymbol = ""
    @Published var randomSymbolExample = ""
    @Published var displaySymbol = ""
    @Published var score = 0
    @Published var femaleSoundBPMF = ""
    @Published var maleSoundBPMF = ""
    @Published var inputSymbol: String = "" {
        didSet {
            checkUserInput()
        }
    }
        
    private func addSubscribers() {
        $timer
            .first(where: { $0 <= 0 })
            .sink { [weak self] time in
                self?.testDidFinish()
            }
            .store(in: &cancellables)
    }
    
    func checkSymbols(a: String, b: String) {
        if a == b {
            score += 1
        }
    }
    
    func generateNewSymbol() {
        
        let randomNumber = Int.random(in: 0...symbolList.count-1)
        randomSymbol = symbolList[randomNumber]
        displaySymbol = symbolList[randomNumber]
        randomSymbolExample = symbolPronunciation[randomNumber]
        femaleSoundBPMF = "F_" + randomSymbol
        maleSoundBPMF = "M_" + randomSymbol
        
        if contentStore.pronunciationVoiceMode {
            if contentStore.voiceSelection == .male {
                SoundManager.instance.playSound(sound: maleSoundBPMF)
            }
            if contentStore.voiceSelection == .female {
                SoundManager.instance.playSound(sound: femaleSoundBPMF)
            }
        }
    }
    
    private func checkUserInput() {
        guard inputSymbol != "", randomSymbol != "" else { return }

        switch contentStore.testType {
        case .zhuyin:
            if inputSymbol == randomSymbol {
                score += 1
                generateNewSymbol()
            }
        case .pinyinToZhuyin:
            if inputSymbol == contentStore.testType.pinyinDictionary[randomSymbol] {
                score += 1
                generateNewSymbol()
            }
        }
        inputSymbol = ""
    }
    
    private func testDidFinish() {
        self.testFinished = true
        if self.score > 0 {
            let score = ScoreModel(
                score: self.score,
                time: self.contentStore.timerValue
            )
            Task {
                try await self.contentStore.saveHighScore(testType: contentStore.testType, scoreModel: score)
                let scores = try await self.contentStore.retrieveScores(testType: contentStore.testType, scoreModel: score)
                self.scorePercentage = calculateScorePercentageStanding(scores: scores)
            }
        }
        
        if contentStore.testType == .zhuyin, score > UserDefaults.standard.integer(forKey: "highscore-zhuyin" + String(contentStore.timerValue)) {
            UserDefaults.standard.set(score, forKey: "highscore-zhuyin" + String(contentStore.timerValue))
        } else if contentStore.testType == .pinyinToZhuyin, score > UserDefaults.standard.integer(forKey: "highscore-pinyintozhuyin" + String(contentStore.timerValue)) {
            UserDefaults.standard.set(score, forKey: "highscore-pinyintozhuyin" + String(contentStore.timerValue))
        }
        ReviewManager.shared.updateSessionsCompleted()
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
