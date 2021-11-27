//
//  PinyinZhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI

struct PinyinZhuyin: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pronunciation : Bool
    
    // Symbols
    let zhuyinSymbols = ["b","d","ˇ","ˋ","zh","ˊ","˙","a","ai","an","er",
    "p","t","g","j","ch","z","i","o","ei","en","m","n","k","q","sh","c","wu","e","ao","ang","f","l","h","x","r","s","ü","eh","ou","eng"]
    
    let zhuyinSymbolsExample =
        ["ㄅ b in boy",
         "ㄉ d in dad",
         "n/a",
         "n/a",
         "ㄓ je in jerk",
         "n/a",
         "n/a",
         "ㄚ a in fat",
         "ㄞ igh in sigh",
         "ㄢ an in iguana",
         "ㄦ ur in fur",
         "ㄆ p in pout",
         "ㄊ t in tone",
         "ㄍ g in iguana",
         "ㄐ j in june",
         "ㄔ ch in choke",
         "ㄗ z in zip",
         "ㄧ i in iguana",
         "ㄛ o in go",
         "ㄟ ay in lay",
         "ㄣ en in pen",
         "ㄇ m in mom",
         "ㄋ n in no",
         "ㄎ k in kit",
         "ㄑ like the ch sound, but using kissy lips",
         "ㄕ sh in shot",
         "ㄘ ts in cats",
         "ㄨ u in iguana",
         "ㄜ uh in duh",
         "ㄠ ow in cow",
         "ㄤ a(ㄚ) + ng from rung\nang",
         "ㄈ f in fat",
         "ㄌ l in low",
         "ㄏ h in how",
         "ㄒ e when smiling while\nsaying 'she'",
         "ㄖ r in drought",
         "ㄙ s in soon",
         "ㄩ u in june",
         "ㄝ e in yet",
         "ㄡ ow in row",
         "ㄥ e(ㄝ) + ng from rung"]
    
    @State var randomSymbol = ""
    @State var randomSymbolExample = ""
    @State var inputSymbol = ""
    
    // Scoring
    @State var score = 0
   
    // Timer
    @State var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    // Functions
    func generateNewSymbol() {
        if timeRemaining > 0 {
            let randomNumber = Int.random(in: 0...zhuyinSymbols.count-1)
            randomSymbol = zhuyinSymbols[randomNumber]
            randomSymbolExample = zhuyinSymbolsExample[randomNumber]
        }
    }
    
    func checkSymbols(a:String,b:String) {
        if a == b && timeRemaining > 0{
            self.score += 1
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
                            .multilineTextAlignment(.center)
                            .padding()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .font(.system(size:100))
                            .foregroundColor(.black)
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

struct PinyinZhuyin_Previews: PreviewProvider {
    
    @State static var pronunciation = true
    
    static var previews: some View {
        PinyinZhuyin(pronunciation : $pronunciation)
    }
}
