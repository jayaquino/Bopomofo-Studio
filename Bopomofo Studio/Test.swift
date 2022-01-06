//
//  Test.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/29/21.
//

import SwiftUI

struct Test: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contentOne: [String]
    @Binding var contentTwo: [String]
    @Binding var pronunciationTextMode: Bool
    @Binding var timerValue: Double
    @State var timerSetValue = 0.0
    @State var randomSymbol:String = ""
    @State var randomKey:String = ""
    @State var userInput = ""
    
    // Scoring
    @State var score = 0
    @State var wrongWords : Array<String> = []
    @State var wrongKey : Array<String> = []
    @State var correctKey : Array<String> = []
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
   
    // Timer
   
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    let randomNumber = 0
    
    init(contentOne: Binding<[String]>,contentTwo: Binding<[String]>,pronunciationTextMode: Binding<Bool>,timerValue: Binding<Double>){
        _contentOne = contentOne
        _contentTwo = contentTwo
        _pronunciationTextMode = pronunciationTextMode
        _timerValue = timerValue
        _timerSetValue = State(initialValue: timerValue.wrappedValue)
    }
   
    // Functions
    func generateNewSymbol() {
        if timerValue > 0 {
            let randomNumber = Int.random(in: 0...contentOne.count-1)
            randomSymbol = contentOne[randomNumber]
            randomKey = contentTwo[randomNumber]
        }
    }
    
    func checkSymbols(a:String,b:String) {
        if a == b && timerValue > 0{
            self.score += 1
            SoundManager.instance.playSound(sound: "ding")
        }
        else{
            SoundManager.instance.playSound(sound: "bonk")
        }
    }
  
    
    var body: some View {
    
        ZStack{
            VStack(alignment: .center) {
                Text("Score: " + String(self.score))
                    .navigationBarBackButtonHidden(true)
                if pronunciationTextMode == true{
                    Text(randomKey)
                        .padding()
                        .opacity(0.5)
                }
                ZStack{
                    Text(randomSymbol)
                        .padding()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .font(.custom("copperplate", size: 25))
                        .foregroundColor(teal)
                        .frame(minHeight: 200)
                        .frame(maxHeight: 250)
                        .onAppear(perform: {
                            generateNewSymbol()
                        })
                        .multilineTextAlignment(.center)
                        .animation(.easeIn)
                        
                        
                }
                Text("Input: \(userInput)")
                    .padding(10)
                HStack{
                    
                    Text("Time Remaining: \(timerSetValue, specifier: "%.0f")")
                        .padding(10)
                        .onReceive(timer) { _ in
                                    if timerSetValue > 0  {
                                        timerSetValue -= 1
                                    }
                        }
                }
                HStack{
                    HStack{
                        Button("ㄅ") {
                            self.userInput.append("ㄅ")
                        }.padding(6)
                        Button("ㄉ") {
                            self.userInput.append("ㄉ")
                        }.padding(6)
                        Button("ˇ") {
                            self.userInput.append("ˇ")
                        }.padding(6)
                        Button("ˋ") {
                            self.userInput.append("ˋ")
                        }.padding(6)
                        Button("ㄓ") {
                            self.userInput.append("ㄓ")
                        }.padding(6)
                        Button("ˊ") {
                            self.userInput.append("ˊ")
                        }.padding(6)
                        Button("˙") {
                            self.userInput.append("˙")
                        }.padding(6)
                        Button("ㄚ") {
                            self.userInput.append("ㄚ")
                        }.padding(6)
                        Button("ㄞ") {
                            self.userInput.append("ㄞ")
                        }.padding(6)
                        Button("ㄢ") {
                            self.userInput.append("ㄢ")
                        }.padding(6)
                    }
                    Button("ㄦ") {
                        self.userInput.append("ㄦ")
                    }.padding(6)
                    
                }.foregroundColor(.black)
                HStack{
                    Button("ㄆ") {
                        self.userInput.append("ㄆ")
                    }.padding(5)
                    Button("ㄊ") {
                        self.userInput.append("ㄊ")
                    }.padding(5)
                    Button("ㄍ") {
                        self.userInput.append("ㄍ")
                    }.padding(5)
                    Button("ㄐ") {
                        self.userInput.append("ㄐ")
                    }.padding(5)
                    Button("ㄔ") {
                        self.userInput.append("ㄔ")
                    }.padding(5)
                    Button("ㄗ") {
                        self.userInput.append("ㄗ")
                    }.padding(5)
                    Button("ㄧ") {
                        self.userInput.append("ㄧ")
                    }.padding(5)
                    Button("ㄛ") {
                        self.userInput.append("ㄛ")
                    }.padding(5)
                    Button("ㄟ") {
                        self.userInput.append("ㄟ")
                    }.padding(5)
                    Button("ㄣ") {
                        self.userInput.append("ㄣ")
                    }.padding(5)
                }.foregroundColor(.black)
                HStack{
                    Button("ㄇ") {
                        self.userInput.append("ㄇ")
                    }.padding(4)
                    Button("ㄋ") {
                        self.userInput.append("ㄋ")
                    }.padding(4)
                    Button("ㄎ") {
                        self.userInput.append("ㄎ")
                    }.padding(4)
                    Button("ㄑ") {
                        self.userInput.append("ㄑ")
                    }.padding(4)
                    Button("ㄕ") {
                        self.userInput.append("ㄕ")
                    }.padding(4)
                    Button("ㄘ") {
                        self.userInput.append("ㄘ")
                    }.padding(4)
                    Button("ㄨ") {
                        self.userInput.append("ㄨ")
                    }.padding(4)
                    Button("ㄜ") {
                        self.userInput.append("ㄜ")
                    }.padding(4)
                    Button("ㄠ") {
                        self.userInput.append("ㄠ")
                    }.padding(4)
                    Button("ㄤ") {
                        self.userInput.append("ㄤ")
                    }.padding(4)
                }.foregroundColor(.black)
                HStack{
                    Button("ㄈ") {
                        self.userInput.append("ㄈ")
                    }.padding(6)
                    Button("ㄌ") {
                        self.userInput.append("ㄌ")
                    }.padding(6)
                    Button("ㄏ") {
                        self.userInput.append("ㄏ")
                    }.padding(6)
                    Button("ㄒ") {
                        self.userInput.append("ㄒ")
                    }.padding(6)
                    Button("ㄖ") {
                        self.userInput.append("ㄖ")
                    }.padding(6)
                    Button("ㄙ") {
                        self.userInput.append("ㄙ")
                    }.padding(6)
                    Button("ㄩ") {
                        self.userInput.append("ㄩ")
                    }.padding(6)
                    Button("ㄝ") {
                        self.userInput.append("ㄝ")
                    }.padding(6)
                    Button("ㄡ") {
                        self.userInput.append("ㄡ")
                    }.padding(6)
                    Button("ㄥ") {
                        self.userInput.append("ㄥ")
                    }.padding(6)
                }.foregroundColor(.black)
                VStack{
                    Button("一") {
                        self.userInput.append(" ")
                    }.foregroundColor(.black)
                    HStack(alignment:.center){
                        
                        Spacer()
                        
                        Button("Delete") {
                            userInput = String(userInput.dropLast())
                        }
                        .padding()
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .font(.custom("copperplate", size: 17))
                        .foregroundColor(teal)
                        
                        Spacer()
                        
                        Button("Submit") {
                            checkSymbols(a: userInput, b: randomKey)
                            if userInput != randomKey {
                                wrongWords.append(randomSymbol)
                                wrongKey.append(userInput)
                                correctKey.append(randomKey)
                            }
                            userInput = ""
                            generateNewSymbol()
                        }
                        .padding()
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .font(.custom("copperplate", size: 17))
                        .foregroundColor(teal)
                        
                        Spacer()
                      
                    }
                    .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                    .padding()
                }
                   
                
                
            }
            
            VStack{
                if timerSetValue == 0 {
                    ZStack{
                        Color.gray
                                    .edgesIgnoringSafeArea(.all)
                        VStack{
                            Text("Score: " + String(self.score))
                            Spacer()
                            HStack{
                                VStack{
                                    Text("Word").bold()
                                    ForEach(wrongWords, id: \.self){symbol in
                                        Text(symbol)
                                            .padding(2)
                                            .font(.system(size: 9))
                                            .frame(minHeight:25)
                                            
                                    }
                                }
                                VStack{
                                    Text("Incorrect").bold()
                                    ForEach(wrongKey, id: \.self){symbol in
                                        Text(symbol)
                                            .padding(2)
                                            .font(.system(size: 9))
                                            .frame(minHeight:25)
                                           
                                    }
                                }
                                VStack{
                                    Text("Correct").bold()
                                    ForEach(correctKey, id: \.self){symbol in
                                        Text(symbol)
                                            .padding(2)
                                            .font(.system(size: 9))
                                            .frame(minHeight:25)
                                          
                                    }
                                }
                            }
                            Spacer()
                            Button("Review") {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            .font(.system(size:70))
                            .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    @State static var pronunciationTextMode = true
    @State static var timerValue = 1.1
    
    static var previews: some View {
        Test(contentOne: $contentOne,contentTwo: $contentTwo, pronunciationTextMode: $pronunciationTextMode, timerValue:$timerValue)
    }
}
