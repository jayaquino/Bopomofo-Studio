//
//  Settings.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI

class ZhuyinModeSettings: ObservableObject{
    @Published var pronunciationTextMode = true
    @Published var pronunciationVoiceMode = false
}

struct ZhuyinSettings: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var zhuyinmodeSettings = ZhuyinModeSettings()
    
    @State var timerValue: Double = 30
    @State var voiceSelection = "Female"
    @State var testType = "Zhuyin"
    
    let testTypes = ["Zhuyin","Pinyin To Zhuyin"]
    
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    let voices = ["Female","Male"]
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var body: some View {
        VStack{
            Toggle("Pronunciation Text Assistance", isOn: self.$zhuyinmodeSettings.pronunciationTextMode)
                .padding()
            
            Toggle("Pronunciation Voice Assistance", isOn: self.$zhuyinmodeSettings.pronunciationVoiceMode)
                .padding()
            if self.zhuyinmodeSettings.pronunciationVoiceMode == true{
                VStack{
                    Picker("Style", selection: $voiceSelection) {
                        ForEach(voices, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: screenWidth, height: 100)
                    .padding()
                }.padding()
                
            }
            
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
            
            NavigationLink(destination: ContentPreviewZhuyin(pronunciationTextMode: self.$zhuyinmodeSettings.pronunciationTextMode, pronunciationVoiceMode: self.$zhuyinmodeSettings.pronunciationVoiceMode, voiceSelection: self.$voiceSelection ,timerValue: self.$timerValue,testType:self.$testType)){
                Text("Preview")
                    .frame(width: 200, height: 30, alignment: .center)
                    .foregroundColor(teal)
                    .font(.system(size: 30, weight: .heavy))
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300)
            }
        }
            
            
    }

}

struct ZhuyinSettings_Previews: PreviewProvider {
    
    @State static var testModeSelection = ""
    
    static var previews: some View {
        ZhuyinSettings()
    }
}
