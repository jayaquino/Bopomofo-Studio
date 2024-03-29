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
                VStack(spacing: 40) {
                    VStack(spacing: 20) {
                        Text("General")
                            .font(.title)
                        
                        VStack(alignment: .leading) {
                            Toggle("TOGGLE_PRONUNCIATION_TEXT_ASSISTANCE", isOn: $viewModel.pronunciationTextMode)
                            Text("TOGGLE_PRONUNCIATION_TEXT_ASSISTANCE_SUBTEXT")
                                .font(.subheadline)
                                .fontWeight(.thin)
                        }
                        
                        VStack(alignment: .leading) {
                            Toggle("TOGGLE_PRONUNCIATION_VOICE_ASSISTANCE", isOn: $viewModel.pronunciationVoiceMode)
                            Text("TOGGLE_PRONUNCIATION_VOICE_ASSISTANCE_SUBTEXT")
                                .font(.subheadline)
                                .fontWeight(.thin)
                        }
                        VStack(alignment: .center) {
                            Slider(value: $viewModel.timerValue, in: 30...300, step:10, onEditingChanged: { editing in
                                if !editing {
                                    viewModel.handleTimerValueSliderChanged()
                                }
                            }).padding(10)
                            
                            Text("Timer (s): \(viewModel.timerValue, specifier: "%.0f")")
                                .foregroundColor(.accentColor)
                                .font(.subheadline)
                        }
                    }
                    Divider()
                        .padding()
                    VStack(spacing: 10) {
                        Text("Bopomofo")
                            .font(.title)
                        Text("Voice Type")
                            .font(.subheadline)
                        Picker("", selection: $viewModel.voiceSelection) {
                            ForEach(ContentStore.VoiceSelection.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        .disabled(!viewModel.pronunciationVoiceMode)
                    }
                    Divider()
                        .padding()
                    VStack(spacing: 20) {
                        Text("Characters")
                            .font(.title)
                        
                            Picker("", selection: $viewModel.characterSet) {
                                ForEach(ContentStore.WordCharacterSet.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            VStack(alignment: .leading) {
                                Toggle("TOGGLE_TRANSLATION", isOn: $viewModel.translationMode)
                                Text("TOGGLE_TRANSLATION_SUBTEXT")
                                    .font(.subheadline)
                                    .fontWeight(.thin)
                            }
                            
                            
                            Slider(value: $viewModel.speakingSpeed, in: 0...100, step: 1, onEditingChanged: { editing in
                                if !editing {
                                    viewModel.handleSpeakingSpeedSliderChanged()
                                }
                            }).padding(10)
                            Text("Speech Speed (slow - fast)")
                                .foregroundColor(.accentColor)
                                .font(.subheadline)
                    }
                }
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
