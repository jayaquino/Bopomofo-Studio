//
//  Settings.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI



struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings : SettingsViewModel
    
    let testTypes = ["ZHUYIN_TITLE","PINYIN_TO_ZHUYIN_TITLE"]
    let voices = ["Female","Male"]
    
    var body: some View {
        VStack {
            Toggle("TOGGLE_PRONUNCIATION_TEXT_ASSISTANCE", isOn: self.$settings.pronunciationTextMode)
                .padding()
            
            Toggle("TOGGLE_PRONUNCIATION_VOICE_ASSISTANCE", isOn: self.$settings.pronunciationVoiceMode)
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
            
            Picker("", selection: $settings.testType) {
                ForEach(testTypes, id: \.self) {
                    Text(LocalizedStringKey($0))
                        .padding()
                        .font(.custom("copperplate",size: 30))
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: Constants.screenWidth, height: 100)
            .padding()
        }
        .navigationTitle("SETTINGS_TITLE")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ZhuyinSettings_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView().environmentObject(SettingsViewModel())
    }
}
