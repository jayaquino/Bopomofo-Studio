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
            ScrollView {
                VStack(spacing: 0) {
                    Text("Bopomofo")
                        .font(.title)
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 0) {
                            Toggle("TOGGLE_PRONUNCIATION_TEXT_ASSISTANCE", isOn: $viewModel.pronunciationTextMode)
                            Text("PICKER_PRONUNCIATION_TEXT_ASSISTANCE_SUBTEXT")
                                .font(.subheadline)
                                .fontWeight(.thin)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Toggle("TOGGLE_PRONUNCIATION_VOICE_ASSISTANCE", isOn: $viewModel.pronunciationVoiceMode)
                            Text("PICKER_PRONUNCIATION_VOICE_ASSISTANCE_SUBTEXT")
                                .font(.subheadline)
                                .fontWeight(.thin)
                        }
                    }
                    .padding()
                    
                    Picker("", selection: $viewModel.voiceSelection) {
                        ForEach(ContentStore.VoiceSelection.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .disabled(!viewModel.pronunciationVoiceMode)
                    
                }
                .padding()
                
                Divider()
                    .padding()
            }
        }
        .navigationTitle("SETTINGS_TITLE")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ZhuyinSettings_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView(
            viewModel: SettingsViewModel(
                contentStore: dev.contentStore,
                analytics: dev.analytics
            )
        )
    }
}
