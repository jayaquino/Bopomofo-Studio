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

    @Binding var pronunciation : Bool
    // Symbols
    let zhuyinSymbols = ["ㄅ","ㄉ","ˇ","ˋ","ㄓ","ˊ","˙","ㄚ","ㄞ","ㄢ","ㄦ",
    "ㄆ","ㄊ","ㄍ","ㄐ","ㄔ","ㄗ","ㄧ","ㄛ","ㄟ","ㄣ","ㄇ","ㄋ","ㄎ","ㄑ","ㄕ","ㄘ","ㄨ","ㄜ","ㄠ","ㄤ","ㄈ","ㄌ","ㄏ","ㄒ","ㄖ","ㄙ","ㄩ","ㄝ","ㄡ","ㄥ"]
    
    let zhuyinSymbolsExample =
        ["b in boy",
         "d in dad",
         "n/a",
         "n/a",
         "je in jerk",
         "n/a",
         "n/a",
         "a in fat",
         "igh in sigh",
         "an in iguana",
         "ur in fur",
         "p in pout",
         "t in tone",
         "g in iguana",
         "j in june",
         "ch in choke",
         "z in zip",
         "i in iguana",
         "o in go",
         "ay in lay",
         "en in pen",
         "m in mom",
         "n in no",
         "k in kit",
         "like the ch sound, using kissy lips",
         "sh in shot",
         "ts in cats",
         "u in iguana",
         "u in shut",
         "ow in cow",
         "a + ng from rung",
         "f in fat",
         "l in low",
         "h in how",
         "smile while hushing sound",
         "r in drought",
         "s in soon",
         "ü in june",
         "e in yet",
         "ow in row",
         "e + ng from rung"]
    
    @State var randomSymbol = ""
    @State var randomSymbolExample = ""
    @State var inputSymbol = ""
    
    // Scoring
    @State var score = 0
   
    // Timer
    @State var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    @State var soundeffect = ""
    // Functions
    func generateNewSymbol() {
        if timeRemaining > 0 {
            let randomNumber = Int.random(in: 0...zhuyinSymbols.count-1)
            randomSymbol = zhuyinSymbols[randomNumber]
            randomSymbolExample = zhuyinSymbolsExample[randomNumber]
            soundeffect = "F_" + randomSymbol
            if pronunciation == true {
                usleep(500000)
                SoundManager.instance.playSound(sound: soundeffect)
            }
        }
       
    }
    
    func checkSymbols(a:String,b:String) {
        if a == b && timeRemaining > 0{
            self.score += 1
            SoundManager.instance.playSound(sound: "ding")
        }
        else{
            SoundManager.instance.playSound(sound: "bonk")
        }
    }
    
    // Game
    @State var showingGame = false
    
    var body: some View {
        
        ZStack{
            
            
            VStack(alignment: .center) {
                Text("Score: " + String(self.score))
 
                Spacer()
                    .frame(width: 0.0, height: 100.0)
                ZStack{
                    VStack{
                        Text(randomSymbol)
                            .padding()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .font(.system(size:100))
                            .foregroundColor(.black)
                            .frame(minHeight: 200)
                            .onAppear(perform: {
                                generateNewSymbol()
                            })
                        if pronunciation == true {
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
                    Text("Time Remaining: \(timeRemaining)")
                        .onReceive(timer) { _ in
                                        if timeRemaining > 0 {
                                            timeRemaining -= 1
                                        }
                        }
                }
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
                Spacer()
            }.foregroundColor(.black)
            
            VStack{
                if timeRemaining == 0 {
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

struct Zhuyin_Previews: PreviewProvider {
    
    @State static var pronunciation = true
    
    static var previews: some View {
        Zhuyin(pronunciation:$pronunciation)
    }
}
