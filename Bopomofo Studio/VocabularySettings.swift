//
//  VocabularySettings.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/28/22.
//

import SwiftUI

class VocabularyModeSettings: ObservableObject{
    @Published var pronunciationTextMode = true
    @Published var pronunciationVoiceMode = false
}

struct VocabularySettings: View {
    
    @ObservedObject var vocabularymodeSettings = ZhuyinModeSettings()
    
    @State var timerValue: Double = 30
    @State var testType = "Bopomofo"
    
    let testTypes = ["Bopomofo","Flashcards"]
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var body: some View {
        VStack{
            Text("The purpose of this section is to learn topic-based vocabulary. Select your topic and preview the vocabulary set. You can test yourself through a Zhuyin keyboard test, or through flashcards.")
                .italic()
                .padding()
            
            HStack{
                Spacer()
                Slider(value: $timerValue, in: 30...300, step:10).padding(10)
                Spacer()
            }
            Text("Timer (s): \(timerValue, specifier: "%.2f")")
            
            Spacer()
            
            Picker("Style", selection: $testType) {
                ForEach(testTypes, id: \.self) {
                    Text($0)
                        .padding()
                        .font(.custom("copperplate",size: 30))
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: screenWidth, height: 100)
            .padding()
            
            NavigationLink(destination: Vocabulary(pronunciationTextMode: self.$vocabularymodeSettings.pronunciationTextMode,timerValue:self.$timerValue,testType:self.$testType)){
                Text("Start")
                    .frame(width: 200, height: 30, alignment: .center)
                    .foregroundColor(teal)
                    .font(.system(size: 30, weight: .heavy))
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300)
            }
            
        }
    }
}

struct VocabularySettings_Previews: PreviewProvider {
    static var previews: some View {
        VocabularySettings()
    }
}
