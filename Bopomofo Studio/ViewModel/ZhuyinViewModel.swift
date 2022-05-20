//
//  ZhuyinViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 5/11/22.
//

import Foundation

class ZhuyinViewModel: ObservableObject, Identifiable {
    
    //MARK: - Variables
    
    let testList = TestList()
    let testType : String
    
    var symbolList : [String] {
        get {
            return testList.zhuyinSymbols
        }
    }
    var symbolPronunciation : [String] {
        get {
            if testType == "Zhuyin" {
                return testList.zhuyinPronunciation
            } else {
                return testList.pinyinPronunciation
            }
        }
    }

    
    init(testType: String) {
        self.testType = testType

        let randomNumber = Int.random(in: 0...symbolList.count-1)
        randomSymbol = symbolList[randomNumber]
        if testType == "Zhuyin"{
            displaySymbol = testList.zhuyinSymbols[randomNumber]
            randomSymbolExample = testList.zhuyinPronunciation[randomNumber]
        } else {
            displaySymbol = testList.pinyinSymbols[randomNumber]
            randomSymbolExample = testList.pinyinPronunciation[randomNumber]
        }
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
            if testType == "Zhuyin"{
                displaySymbol = testList.zhuyinSymbols[randomNumber]
                randomSymbolExample = testList.zhuyinPronunciation[randomNumber]
            } else {
                displaySymbol = testList.pinyinSymbols[randomNumber]
                randomSymbolExample = testList.pinyinPronunciation[randomNumber]
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
}
