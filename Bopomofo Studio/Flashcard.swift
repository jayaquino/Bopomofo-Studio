//
//  Flashcard.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/4/22.
//

import SwiftUI

struct Flashcard: View {
    @Binding var contentOne: [String]
    @Binding var contentTwo: [String]
    @Binding var pronunciationTextMode: Bool
    @Binding var timerValue: Double
    
    @State var randomSymbol:String = ""
    @State var randomKey:String = ""
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func generateNewSymbol() {
        if timerValue > 0 {
            let randomNumber = Int.random(in: 0...contentOne.count-1)
            randomSymbol = contentOne[randomNumber]
            randomKey = contentTwo[randomNumber]
        }
    }
    
    @State var flipper = "0"
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        VStack{
            VStack{
                if flipper == "0" {
                    Text("—")
                        .padding()
                        .frame(width: screenWidth, height: screenHeight/4)
                        .font(.custom("chalkboard se",size: 90))
                        .foregroundColor(teal)
                }
                if flipper == "1" {
                    Text(randomKey)
                        .padding()
                        .frame(width: screenWidth, height: screenHeight/4)
                        .font(.custom("chalkboard se",size: 30))
                        .foregroundColor(teal)
                }
                Text(randomSymbol)
                    .padding()
                    .frame(width: screenWidth, height: screenHeight/4)
                    .font(.custom("copperplate",size: 25))
                    .foregroundColor(teal)
            }
            Text("")
                .frame(width: screenWidth, height: 1)
                .background(teal)
                .padding()
            Button("Next"){
                if flipper == "0" {
                    flipper = "1"
                }
                else if flipper == "1" {
                    generateNewSymbol()
                    flipper = "0"
                }

            }
                .padding()
                .frame(width: screenWidth, height: screenHeight/4)
                .onAppear(perform: generateNewSymbol)
                .font(.custom("copperplate",size: 90))
                .foregroundColor(.white)
                .background(teal)
                .cornerRadius(screenHeight)
            Spacer()
                
                
        }
    }
}

struct Flashcard_Previews: PreviewProvider {
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    @State static var pronunciationTextMode = true
    @State static var timerValue = 1.1
    static var previews: some View {
        Flashcard(contentOne: $contentOne,contentTwo: $contentTwo, pronunciationTextMode: $pronunciationTextMode, timerValue:$timerValue)
    }
}
