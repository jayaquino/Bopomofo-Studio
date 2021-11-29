//
//  PinyinZhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI
import Darwin

struct PinyinZhuyin: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pronunciationTextMode : Bool
    @Binding var pronunciationVoiceMode : Bool
    @Binding var voiceSelection : String
    @Binding var timerValue : Double
  
    @State var timerSetValue = 0.0
    // Symbols
    let pinyinSymbols = ["b","p","m","f","d","t","n","l","ˇ","g","k",
                         "h","ˋ","j","q","x","zh","ch","sh","r","ˊ","z","c","s","˙","i","u","ü","a","o","e","e","ai","ei","ao","ou","an","en","ang","eng","er"]
    
    let zhuyinSymbols = ["ㄅ","ㄆ","ㄇ","ㄈ","ㄉ","ㄊ","ㄋ","ㄌ","ˇ","ㄍ","ㄎ",
                         "ㄏ","ˋ","ㄐ","ㄑ","ㄒ","ㄓ","ㄔ","ㄕ","ㄖ","ˊ","ㄗ","ㄘ","ㄙ","˙","ㄧ","ㄨ","ㄩ","ㄚ","ㄛ","ㄜ","ㄝ","ㄞ","ㄟ","ㄠ","ㄡ","ㄢ","ㄣ","ㄤ","ㄥ","ㄦ"]
    
    let zhuyinSymbolsExample =
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
    
    @State var randomSymbol = ""
    @State var randomZhuyinSymbol = ""
    @State var randomSymbolExample = ""
    @State var inputSymbol = ""
    
    // Scoring
    @State var score = 0
   
    // Timer
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    let delayInSeconds = 0.5
    
    @State var femaleSoundBPMF = ""
    @State var maleSoundBPMF = ""
    
    // Functions
    func generateNewSymbol() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            if timerSetValue > 0 {
                let randomNumber = Int.random(in: 0...pinyinSymbols.count-1)
                randomSymbol = pinyinSymbols[randomNumber]
                randomZhuyinSymbol = zhuyinSymbols[randomNumber]
                randomSymbolExample = zhuyinSymbolsExample[randomNumber]
                femaleSoundBPMF = "F_" + randomZhuyinSymbol
                maleSoundBPMF = "M_" + randomZhuyinSymbol
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
    
    // Game
    @State var showingGame = false
    
    init(pronunciationTextMode: Binding<Bool>,pronunciationVoiceMode: Binding<Bool>,voiceSelection: Binding<String>,timerValue:Binding<Double>){
        _pronunciationTextMode = pronunciationTextMode
        _pronunciationVoiceMode = pronunciationVoiceMode
        _voiceSelection = voiceSelection
        _timerValue = timerValue
        _timerSetValue = State(initialValue: timerValue.wrappedValue)
    }
    
    var body: some View {
        ZStack{
            
            VStack(alignment: .center) {
                Text("Score: " + String(self.score)).padding(10)
                ZStack{
                    VStack{
                        Text(randomSymbol)
                            .multilineTextAlignment(.center)
                            .padding()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .font(.system(size:100))
                            .foregroundColor(.black)
                            .onAppear{
                                let randomNumber = Int.random(in: 0...zhuyinSymbols.count-1)
                                    randomSymbol = pinyinSymbols[randomNumber]
                            }
                        if pronunciationTextMode == true {
                            Text(randomSymbolExample)
                                .padding()
                                .opacity(0.5)
                        }
                    }
                    .frame(minHeight: 200)
                    .frame(maxHeight: 250)
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
                HStack{
                    HStack{
                        Button("ㄅ") {
                            checkSymbols(a:"b",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄉ") {
                            checkSymbols(a:"d",b:randomSymbol)
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
                            checkSymbols(a:"zh",b:randomSymbol)
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
                            checkSymbols(a:"a",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄞ") {
                            checkSymbols(a:"ai",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                        Button("ㄢ") {
                            checkSymbols(a:"an",b:randomSymbol)
                            generateNewSymbol()
                        }.padding(6)
                    }
                    Button("ㄦ") {
                        checkSymbols(a:"er",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    
                }.foregroundColor(.black)
                HStack{
                    Button("ㄆ") {
                        checkSymbols(a:"p",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄊ") {
                        checkSymbols(a:"t",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄍ") {
                        checkSymbols(a:"g",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄐ") {
                        checkSymbols(a:"j",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄔ") {
                        checkSymbols(a:"ch",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄗ") {
                        checkSymbols(a:"z",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄧ") {
                        checkSymbols(a:"ㄧ",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄛ") {
                        checkSymbols(a:"o",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄟ") {
                        checkSymbols(a:"ei",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                    Button("ㄣ") {
                        checkSymbols(a:"en",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(5)
                }.foregroundColor(.black)
                HStack{
                    Button("ㄇ") {
                        checkSymbols(a:"m",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄋ") {
                        checkSymbols(a:"n",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄎ") {
                        checkSymbols(a:"k",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄑ") {
                        checkSymbols(a:"q",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄕ") {
                        checkSymbols(a:"sh",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄘ") {
                        checkSymbols(a:"c",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄨ") {
                        checkSymbols(a:"wu",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄜ") {
                        checkSymbols(a:"e",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄠ") {
                        checkSymbols(a:"ao",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                    Button("ㄤ") {
                        checkSymbols(a:"ang",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(4)
                }.foregroundColor(.black)
                HStack{
                    Button("ㄈ") {
                        checkSymbols(a:"f",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄌ") {
                        checkSymbols(a:"l",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄏ") {
                        checkSymbols(a:"h",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄒ") {
                        checkSymbols(a:"x",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄖ") {
                        checkSymbols(a:"r",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄙ") {
                        checkSymbols(a:"s",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄩ") {
                        checkSymbols(a:"ü",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄝ") {
                        checkSymbols(a:"eh",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄡ") {
                        checkSymbols(a:"ou",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                    Button("ㄥ") {
                        checkSymbols(a:"eng",b:randomSymbol)
                        generateNewSymbol()
                    }.padding(6)
                }
                Spacer()
            }.foregroundColor(.black)
            
            VStack{
                if timerSetValue == 0 {
                    ZStack{
                        Color.gray
                                    .opacity(0.4)
                                    .edgesIgnoringSafeArea(.all)
                        Button("Return") {
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

struct PinyinZhuyin_Previews: PreviewProvider {
    
    @State static var pronunciationTextMode = true
    @State static var pronunciationVoiceMode = true
    @State static var voiceSelection = ""
    @State static var timerValue = 1.1

    
    static var previews: some View {
        PinyinZhuyin(pronunciationTextMode : $pronunciationTextMode, pronunciationVoiceMode : $pronunciationVoiceMode, voiceSelection: $voiceSelection, timerValue:$timerValue)
    }
}
