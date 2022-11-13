//
//  SettingsViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import Combine
import CoreBopomofoStudio

class SettingsViewModel: ObservableObject {
    
    let contentStore: ContentStore
    let analytics: AnalyticsProvider
    
    @Published var testType: ContentStore.TestType = .zhuyin
    @Published var voiceSelection: ContentStore.VoiceSelection = .female
    @Published var pronunciationTextMode: Bool = false
    @Published var pronunciationVoiceMode: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider
    ) {
        self.analytics = analytics
        self.contentStore = contentStore

        assignVariables()
        addSubscribers()
    }
    
    func assignVariables() {
        self.testType = contentStore.testType
        self.voiceSelection = contentStore.voiceSelection
        self.pronunciationTextMode = contentStore.pronunciationTextMode
        self.pronunciationVoiceMode = contentStore.pronunciationVoiceMode
    }
    
    func addSubscribers() {
        $testType
            .sink { value in
                self.contentStore.testType = value
            }
            .store(in: &cancellables)
        
        $voiceSelection
            .sink { value in
                self.contentStore.voiceSelection = value
                self.trackEvent(event: .voiceType(voiceType: value.rawValue))
            }
            .store(in: &cancellables)
        
        $pronunciationTextMode
            .dropFirst()
            .sink { isOn in
                self.contentStore.pronunciationTextMode = isOn
                self.trackEvent(event: .textAssistance(isOn: isOn))
            }
            .store(in: &cancellables)
        
        $pronunciationVoiceMode
            .dropFirst()
            .sink { isOn in
                self.contentStore.pronunciationVoiceMode = isOn
                self.trackEvent(event: .voiceAssistance(isOn: isOn))
            }
            .store(in: &cancellables)
    }
    
    func trackEvent(event: AnalyticsProvider.SettingsAnalyticEvent) {
        self.analytics.track(event: .settings(event: event))
    }
}
