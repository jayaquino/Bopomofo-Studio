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
    var cancellables = Set<AnyCancellable>()
    
    @Published var timer: Double
    @Published var testFinished = false
    @Published var scorePercentage: Double?
    
    var symbolList : [String] {
        get {
            return contentStore.testList.zhuyinSymbols
        }
    }
    var symbolPronunciation : [String] {
        get {
            if contentStore.testType == .zhuyin {
                return contentStore.testList.zhuyinPronunciation
            } else {
                return contentStore.testList.pinyinPronunciation
            }
        }
    }

    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
        self.timer = contentStore.timerValue
        let randomNumber = Int.random(in: 0...symbolList.count-1)
        randomSymbol = symbolList[randomNumber]
        if contentStore.testType == .zhuyin {
            displaySymbol = contentStore.testList.zhuyinSymbols[randomNumber]
            randomSymbolExample = contentStore.testList.zhuyinPronunciation[randomNumber]
        } else {
            displaySymbol = contentStore.testList.pinyinSymbols[randomNumber]
            randomSymbolExample = contentStore.testList.pinyinPronunciation[randomNumber]
        }
        
        $timer
            .first(where: { $0 <= 0 })
            .sink { time in
                self.testDidFinish()
            }
            .store(in: &cancellables)
    }
    
    @Published var randomSymbol = ""
    @Published var randomSymbolExample = ""
    @Published var displaySymbol = ""
    @Published var score = 0
    @Published var femaleSoundBPMF = ""
    @Published var maleSoundBPMF = ""
    
    let keyboardRow1 : [String] = ["ㄅ","ㄉ","ˇ","ˋ","ㄓ","ˊ","˙","ㄚ","ㄞ","ㄢ","ㄦ"]
    let keyboardRow2 : [String] = ["ㄆ","ㄊ","ㄍ","ㄐ","ㄔ","ㄗ","ㄧ","ㄛ","ㄟ","ㄣ"]
    let keyboardRow3 : [String] = ["ㄇ","ㄋ","ㄎ","ㄑ","ㄕ","ㄘ","ㄨ","ㄜ","ㄠ","ㄤ"]
    let keyboardRow4 : [String] = ["ㄈ","ㄌ","ㄏ","ㄒ","ㄖ","ㄙ","ㄩ","ㄝ","ㄡ","ㄥ"]
    
    //MARK: - Functions
    
    func checkSymbols(a:String,b:String) {
        if a == b {
            score += 1
        }
    }
    
    func generateNewSymbol(pronunciationVoiceMode: Bool, voiceSelection: String) {
        
        let randomNumber = Int.random(in: 0...symbolList.count-1)
        randomSymbol = symbolList[randomNumber]
        if contentStore.testType == .zhuyin {
            displaySymbol = contentStore.testList.zhuyinSymbols[randomNumber]
            randomSymbolExample = contentStore.testList.zhuyinPronunciation[randomNumber]
        } else {
            displaySymbol = contentStore.testList.pinyinSymbols[randomNumber]
            randomSymbolExample = contentStore.testList.pinyinPronunciation[randomNumber]
        }
        femaleSoundBPMF = "F_" + randomSymbol
        maleSoundBPMF = "M_" + randomSymbol
        
        if pronunciationVoiceMode == true {
            
            if voiceSelection == "Male" {
                SoundManager.instance.playSound(sound: maleSoundBPMF)
            }
            if voiceSelection == "Female"{
                SoundManager.instance.playSound(sound: femaleSoundBPMF)
            }
        }
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
    }
    
    private func calculateScorePercentageStanding(scores: [ScoreModel]) -> Double? {
        let maxScore = scores.compactMap({ $0.score }).max()
        guard let maxScore = maxScore else {
            return nil
        }
        let scorePercentage = Double(score) / Double(maxScore) * 100.0
        return scorePercentage.rounded()
    }
}
