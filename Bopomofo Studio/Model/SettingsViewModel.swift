//
//  SettingsViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 5/11/22.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var pronunciationTextMode : Bool = false
    @Published var pronunciationVoiceMode : Bool = false
    @Published var timerValue : Double = 30
    @Published var voiceSelection = "Female"
    @Published var testType = "Zhuyin"
    @Published var contentOne : [String] = []
    @Published var contentTwo : [String] = []
    @Published var testID : String = ""
}
