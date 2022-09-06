//
//  Settings.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI
import CoreBopomofoStudio
import MockProvider

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            Toggle("TOGGLE_PRONUNCIATION_TEXT_ASSISTANCE", isOn: $viewModel.pronunciationTextMode)
                .padding()
            
            Toggle("TOGGLE_PRONUNCIATION_VOICE_ASSISTANCE", isOn: $viewModel.pronunciationVoiceMode)
                .padding()
            
            if viewModel.pronunciationVoiceMode == true {
                VStack{
                    Picker("Style", selection: $viewModel.voiceSelection) {
                        ForEach(ContentStore.VoiceSelection.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .frame(width: Constants.screenWidth, height: 100)
                    .padding()
                }.padding()
            }
            
            Picker("", selection: $viewModel.testType) {
                ForEach(ContentStore.TestType.allCases, id: \.self) {
                    Text(LocalizedStringKey($0.rawValue))
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
        SettingsView(
            viewModel: SettingsViewModel(
                contentStore: ContentStore(
                    provider: MockContentProvider()
                )
            )
        )
    }
}
