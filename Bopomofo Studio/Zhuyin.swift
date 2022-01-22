//
//  Zhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI
import Darwin

struct Zhuyin: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pronunciationTextMode : Bool
    @Binding var pronunciationVoiceMode: Bool
    @Binding var testModeSelection : String
    @Binding var voiceSelection : String
    @Binding var timerValue : Double
    
    @State var timerSetValue = 0.0
    
    // Symbols
    
    let zhuyinSymbols = ["ㄅ","ㄆ","ㄇ","ㄈ","ㄉ","ㄊ","ㄋ","ㄌ","ˇ","ㄍ","ㄎ",
                         "ㄏ","ˋ","ㄐ","ㄑ","ㄒ","ㄓ","ㄔ","ㄕ","ㄖ","ˊ","ㄗ","ㄘ","ㄙ","˙","ㄧ","ㄨ","ㄩ","ㄚ","ㄛ","ㄜ","ㄝ","ㄞ","ㄟ","ㄠ","ㄡ","ㄢ","ㄣ","ㄤ","ㄥ","ㄦ"]
    
    let pinyinSymbols = ["b","p","m","f","d","t","n","l","ˇ","g","k",
                         "h","ˋ","j","q","x","zh","ch","sh","r","ˊ","z","c","s","˙","i","u","ü","a","o","e","e","ai","ei","ao","ou","an","en","ang","eng","er"]
    
    let zhuyinSymbolsExample =
    ["b in boy",
     "p in pout",
     "m in mom",
     "f in fat",
     "d in dad",
     "t in tone",
     "n in no",
     "l in low",
     "3rd tone",
     "g in iguana",
     "k in kit",
     "h in how",
     "4th tone",
     "j in june",
     "like the ch sound, but while smiling",
     "sh in sheesh",
     "je in jerk",
     "ch in choke",
     "sh in shot",
     "r in drought",
     "2nd tone",
     "z in zip",
     "ts in cats",
     "s in soon",
     "neutral tone",
     "i in iguana",
     "u in iguana",
     "ü in june",
     "a in fat",
     "o in go",
     "uh in duh",
     "e in yet",
     "igh in sigh",
     "ay in lay",
     "ow in cow",
     "ow in row",
     "an in iguana",
     "en in pen",
     "a + nasal sound",
     "ngue in tongue",
     "ur in fur",]
    
    let pinyinSymbolsExample =
    ["ㄅ b in boy",
     "ㄆ p in pout",
     "ㄇ m in mom",
     "ㄈ f in fat",
     "ㄉ d in dad",
     "ㄊ t in tone",
     "ㄋ n in no",
     "ㄌ l in low",
     "ˇ 3rd tone",
     "ㄍ g in iguana",
     "ㄎ k in kit",
     "ㄏ h in how",
     "ˋ 4th tone",
     "ㄐ j in june",
     "ㄑ like the ch sound, but while smiling",
     "ㄒ sh in sheesh",
     "ㄓ je in jerk",
     "ㄔ ch in choke",
     "ㄕ sh in shot",
     "ㄖ r in drought",
     "ˊ 2nd tone",
     "ㄗ z in zip",
     "ㄘ ts in cats",
     "ㄙ s in soon",
     "˙ neutral tone",
     "ㄧ i in iguana",
     "ㄨ u in iguana",
     "ㄩ ü in june",
     "ㄚ a in fat",
     "ㄛ o in go",
     "ㄜ uh in duh",
     "ㄝ e in yet",
     "ㄞ igh in sigh",
     "ㄟ ay in lay",
     "ㄠ ow in cow",
     "ㄡ ow in row",
     "ㄢ an in iguana",
     "ㄣ en in pen",
     "ㄤ a + nasal sound",
     "ㄥ ngue in tongue",
     "ㄦ ur in fur"]
    
    let pinyinDictionary : [String:String] = ["b":"ㄅ","p":"ㄆ","m":"ㄇ","f":"ㄈ","d":"ㄉ","t":"ㄊ","n":"ㄋ","l":"ㄌ","ˇ":"ˇ","g":"ㄍ","k":"ㄎ","h":"ㄏ","ˋ":"ˋ","j":"ㄐ","q":"ㄑ","x":"ㄒ","zh":"ㄓ","ch":"ㄔ","sh":"ㄕ","r":"ㄖ","ˊ":"ˊ","z":"ㄗ","c":"ㄘ","s":"ㄙ","˙":"˙","i":"ㄧ","u":"ㄨ","ü":"ㄩ","a":"ㄚ","o":"ㄛ","e":"ㄜ","e ":"ㄝ","ai":"ㄞ","ei":"ㄟ","ao":"ㄠ","ou":"ㄡ","an":"ㄢ","en":"ㄣ","ang":"ㄤ","eng":"ㄥ","er":"ㄦ"]
    
    @State var randomSymbol = ""
    @State var randomSymbolExample = ""
    @State var displaySymbol = ""
    @State var inputSymbol = ""
    
    var dictionaryInput : String  = ""
    
    // Scoring
    @State var score = 0
    
    // Timer
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    let delayInSeconds = 0.5
    
    @State var femaleSoundBPMF = ""
    @State var maleSoundBPMF = ""
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    
    // Functions
    func generateNewSymbol() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            if timerSetValue > 0 {
                let randomNumber = Int.random(in: 0...zhuyinSymbols.count-1)
                randomSymbol = zhuyinSymbols[randomNumber]
                if testModeSelection == "Zhuyin"{
                    displaySymbol = zhuyinSymbols[randomNumber]
                    randomSymbolExample = zhuyinSymbolsExample[randomNumber]
                }
                if testModeSelection == "PinyintoZhuyin" {
                    displaySymbol = pinyinSymbols[randomNumber]
                    randomSymbolExample = pinyinSymbolsExample[randomNumber]
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
        
    }
    
    func checkSymbols(a:String,b:String) {
        if a == b && timerSetValue > 0{
            self.score += 1
            SoundManager.instance.playSound(sound: "ding")
        }
        else{
            SoundManager.instance.playSound(sound: "bonk")
        }
    }
    
    
    func onLoad() {
        if !didAppear {
            let randomNumber = Int.random(in: 0...zhuyinSymbols.count-1)
            if testModeSelection == "Zhuyin"{
                randomSymbol = zhuyinSymbols[randomNumber]
                randomSymbolExample = zhuyinSymbolsExample[randomNumber]
            }
            if testModeSelection == "PinyintoZhuyin" {
                randomSymbol = pinyinSymbols[randomNumber]
                randomSymbolExample = pinyinSymbolsExample[randomNumber]
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
            didAppear = true
        }
        
    }
    // Game
    @State var showingGame = false
    
    init(pronunciationTextMode: Binding<Bool>,pronunciationVoiceMode: Binding<Bool>,voiceSelection: Binding<String>,timerValue:Binding<Double>, testModeSelection:Binding<String>){
        _pronunciationTextMode = pronunciationTextMode
        _pronunciationVoiceMode = pronunciationVoiceMode
        _testModeSelection = testModeSelection
        _voiceSelection = voiceSelection
        _timerValue = timerValue
        _timerSetValue = State(initialValue: timerValue.wrappedValue)
    }
    
    @State var didAppear = false
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var body: some View {
        
        ZStack{
            
            VStack(alignment: .center) {
                HStack{
                    
                    Text("Score: " + String(self.score))
                        .padding()
                        .frame(minWidth: screenWidth*8/10/2,alignment:.leading)
                    
                    if testModeSelection == "Zhuyin"{
                        Text("High Score: " + String(UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(timerValue))))
                            .padding()
                            .frame(minWidth: screenWidth*8/10/2,alignment:.trailing)
                    }
                    else if testModeSelection == "PinyintoZhuyin" {
                        Text("High Score: " + String(UserDefaults.standard.integer(forKey: "highscore-pinyintozhuyin"+String(timerValue)))).padding()
                            .frame(minWidth: screenWidth*8/10/2,alignment:.trailing)
                    }
                    
                }
                
                ZStack{
                    VStack{
                        
                        Text(displaySymbol)
                            .padding()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .font(.system(size:100))
                            .foregroundColor(teal)
                            .frame(minHeight: 200)
                            .onAppear{let randomNumber = Int.random(in: 0...zhuyinSymbols.count-1)
                                randomSymbol = zhuyinSymbols[randomNumber]
                                if testModeSelection == "Zhuyin"{
                                    displaySymbol = zhuyinSymbols[randomNumber]
                                    randomSymbolExample = zhuyinSymbolsExample[randomNumber]
                                }
                                if testModeSelection == "PinyintoZhuyin" {
                                    displaySymbol = pinyinSymbols[randomNumber]
                                    randomSymbolExample = pinyinSymbolsExample[randomNumber]
                                }
                                
                            }
                        
                        
                        if pronunciationTextMode == true {
                            Text(randomSymbolExample)
                                .padding()
                                .opacity(0.5)
                        }
                    }
                    .frame(minHeight: screenHeight/3)
                }
                Spacer()
                HStack{
                    Text("Time Remaining: \(timerSetValue, specifier: "%.0f")")
                        .onReceive(timer) { _ in
                            if timerSetValue > 0 {
                                timerSetValue -= 1
                            }
                        }
                }
                VStack{
                    HStack{
                        HStack{
                            Button("ㄅ") {
                                checkSymbols(a:"ㄅ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ㄉ") {
                                checkSymbols(a:"ㄉ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ˇ") {
                                checkSymbols(a:"ˇ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ˋ") {
                                checkSymbols(a:"ˋ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ㄓ") {
                                checkSymbols(a:"ㄓ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ˊ") {
                                checkSymbols(a:"ˊ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("˙") {
                                checkSymbols(a:"˙",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ㄚ") {
                                checkSymbols(a:"ㄚ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ㄞ") {
                                checkSymbols(a:"ㄞ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                            Button("ㄢ") {
                                checkSymbols(a:"ㄢ",b:randomSymbol)
                                generateNewSymbol()
                            }.padding(6)
                        }
                        Button("ㄦ") {
                            checkSymbols(a:"ㄦ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        
                    }
                    HStack{
                        Button("ㄆ") {
                            checkSymbols(a:"ㄆ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄊ") {
                            checkSymbols(a:"ㄊ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄍ") {
                            checkSymbols(a:"ㄍ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄐ") {
                            checkSymbols(a:"ㄐ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄔ") {
                            checkSymbols(a:"ㄔ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄗ") {
                            checkSymbols(a:"ㄗ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄧ") {
                            checkSymbols(a:"ㄧ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄛ") {
                            checkSymbols(a:"ㄛ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄟ") {
                            checkSymbols(a:"ㄟ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                        Button("ㄣ") {
                            checkSymbols(a:"ㄣ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(5)
                    }
                    HStack{
                        Button("ㄇ") {
                            checkSymbols(a:"ㄇ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄋ") {
                            checkSymbols(a:"ㄋ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄎ") {
                            checkSymbols(a:"ㄎ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄑ") {
                            checkSymbols(a:"ㄑ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄕ") {
                            checkSymbols(a:"ㄕ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄘ") {
                            checkSymbols(a:"ㄘ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄨ") {
                            checkSymbols(a:"ㄨ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄜ") {
                            checkSymbols(a:"ㄜ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄠ") {
                            checkSymbols(a:"ㄠ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                        Button("ㄤ") {
                            checkSymbols(a:"ㄤ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(4)
                    }
                    HStack{
                        Button("ㄈ") {
                            checkSymbols(a:"ㄈ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄌ") {
                            checkSymbols(a:"ㄌ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄏ") {
                            checkSymbols(a:"ㄏ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄒ") {
                            checkSymbols(a:"ㄒ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄖ") {
                            checkSymbols(a:"ㄖ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄙ") {
                            checkSymbols(a:"ㄙ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄩ") {
                            checkSymbols(a:"ㄩ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄝ") {
                            checkSymbols(a:"ㄝ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄡ") {
                            checkSymbols(a:"ㄡ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄥ") {
                            checkSymbols(a:"ㄥ",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                    }
                }.foregroundColor(.black).frame(minHeight: screenHeight/3)
            }
            Spacer()
            
            VStack{
                if timerSetValue == 0 {
                    ZStack{
                        Color.gray
                            .opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                        Button("Return") {
                            if testModeSelection == "Zhuyin"{
                                if score > UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(timerValue)){
                                    UserDefaults.standard.set(score, forKey: "highscore-zhuyin"+String(timerValue))
                                }
                            }
                            else if testModeSelection == "PinyintoZhuyin"{
                                if score > UserDefaults.standard.integer(forKey: "highscore-pinyinzhuyin"+String(timerValue)){
                                    UserDefaults.standard.set(score, forKey: "highscore-pinyintozhuyin"+String(timerValue))
                                }
                            }
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .foregroundColor(.white)
                        .font(.system(size:70))
                    }
                    
                }
            }
        }
    }
}

struct Zhuyin_Previews: PreviewProvider {
    
    @State static var pronunciationTextMode = true
    @State static var pronunciationVoiceMode = true
    @State static var testModeSelection = ""
    @State static var voiceSelection = ""
    @State static var timerValue = 1.1
    
    static var previews: some View {
        Zhuyin(pronunciationTextMode:$pronunciationTextMode, pronunciationVoiceMode:$pronunciationVoiceMode, voiceSelection:$voiceSelection, timerValue:$timerValue,testModeSelection:$testModeSelection)
    }
}
