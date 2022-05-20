//
//  Settings.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI



struct ZhuyinSettings: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings : SettingsViewModel
    
    let testTypes = ["Zhuyin","Pinyin To Zhuyin"]
    let voices = ["Female","Male"]
    
    var body: some View {
        VStack{
            Toggle("Pronunciation Text Assistance", isOn: self.$settings.pronunciationTextMode)
                .padding()
            
            Toggle("Pronunciation Voice Assistance", isOn: self.$settings.pronunciationVoiceMode)
                .padding()
            
            if self.settings.pronunciationVoiceMode == true{
                VStack{
                    Picker("Style", selection: $settings.voiceSelection) {
                        ForEach(voices, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .frame(width: Constants.screenWidth, height: 100)
                    .padding()
                }.padding()
            }
            
            Picker("Style", selection: $settings.testType) {
                ForEach(testTypes, id: \.self) {
                    Text($0)
                        .padding()
                        .font(.custom("copperplate",size: 30))
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: Constants.screenWidth, height: 100)
            .padding()
            
            NavigationLink(destination: ContentPreviewZhuyin()){
                Text("Preview")
                    .frame(width: 200, height: 30, alignment: .center)
                    .font(.system(size: 30, weight: .medium))
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(30)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ZhuyinSettings_Previews: PreviewProvider {
    
    static var previews: some View {
        ZhuyinSettings().environmentObject(SettingsViewModel())
    }
}
