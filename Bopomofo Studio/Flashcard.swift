//
//  Flashcard.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/4/22.
//

import SwiftUI

struct Flashcard: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contentOne: [String]
    @Binding var contentTwo: [String]
    @Binding var pronunciationTextMode: Bool
    @Binding var timerValue: Double
    
    @State var contentOneValue: [String]
    @State var contentTwoValue: [String]
    
    @State var randomSymbol:String = ""
    @State var randomKey:String = ""
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    init(contentOne: Binding<[String]>,contentTwo: Binding<[String]>,pronunciationTextMode: Binding<Bool>,timerValue: Binding<Double>){
        _contentOne = contentOne
        _contentOneValue = State(initialValue: contentOne.wrappedValue)
        _contentTwo = contentTwo
        _contentTwoValue = State(initialValue: contentTwo.wrappedValue)
        _pronunciationTextMode = pronunciationTextMode
        _timerValue = timerValue
    }
    
    
    func generateNewSymbol() {
        if timerValue > 0 {
            let randomNumber = Int.random(in: 0...contentOneValue.count-1)
            randomSymbol = contentOneValue[randomNumber]
            randomKey = contentTwoValue[randomNumber]
            contentOneValue.remove(at:randomNumber)
            contentTwoValue.remove(at:randomNumber)
            
        }
    }
    
    
    @State var flipper = "0"
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        VStack{
            VStack{
                if flipper == "0" {
                    Text("?")
                        .padding()
                        .frame(width: screenWidth, height: screenHeight/5)
                        .font(.custom("chalkboard se",size: 90))
                        .foregroundColor(teal)
                    
                }
                if flipper == "1" {
                    Text(randomKey)
                        .padding()
                        .frame(width: screenWidth, height: screenHeight/5)
                        .font(.custom("chalkboard se",size: 30))
                        .foregroundColor(teal)
                }
                Text("")
                    .frame(width: screenWidth*9/10, height: 2)
                    .background(teal)
                    .padding()
                    .shadow(radius: 2)
                Text(randomSymbol)
                    .padding()
                    .frame(width: screenWidth, height: screenHeight/5, alignment:.center)
                    .font(.custom("copperplate",size: 30))
                    .foregroundColor(teal)
            }
            Spacer()
            Button("Next"){
                if flipper == "0" {
                    flipper = "1"
                }
                else if flipper == "1" {
                    if contentOneValue.count == 0 {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    else {generateNewSymbol()}
                    flipper = "0"
                }
                
            }
            .frame(width: screenWidth*9/10, height: screenHeight/5)
            .onAppear(perform: generateNewSymbol)
            .font(.custom("copperplate",size: 90))
            .foregroundColor(.white)
            .background(teal)
            .cornerRadius(screenHeight)
            .shadow(radius: 20)
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
