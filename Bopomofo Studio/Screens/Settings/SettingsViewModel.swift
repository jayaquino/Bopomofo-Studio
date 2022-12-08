//
//  SettingsViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import Combine
import CoreBopomofoStudio

@MainActor
class SettingsViewModel: ObservableObject {
    
    let contentStore: ContentStore
    let analytics: AnalyticsProvider
    
    @Published var voiceSelection: ContentStore.VoiceSelection = .female
    @Published var pronunciationTextMode = false
    @Published var pronunciationVoiceMode = false
    @Published var timerValue: Double = 30.0 {
        didSet {
            contentStore.timerValue = oldValue
        }
    }
    @Published var speakingSpeed: Double = 50.0 {
        didSet {
            contentStore.speakingSpeed = Float(oldValue/100)
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider
    ) {
        self.analytics = analytics
        self.contentStore = contentStore

        assignVariables()
        addSubscribers()
    }
    
    private func assignVariables() {
        self.voiceSelection = contentStore.voiceSelection
        self.pronunciationTextMode = contentStore.pronunciationTextMode
        self.pronunciationVoiceMode = contentStore.pronunciationVoiceMode
    }
    
    private func addSubscribers() {
        $voiceSelection
            .dropFirst()
            .sink { [weak self] voiceType in
                self?.contentStore.voiceSelection = voiceType
                self?.trackEvent(event: .voiceType(voiceType: voiceType.rawValue))
            }
            .store(in: &cancellables)
        
        $pronunciationTextMode
            .dropFirst()
            .sink { [weak self] isOn in
                self?.contentStore.pronunciationTextMode = isOn
                self?.trackEvent(event: .textAssistance(isOn: isOn))
            }
            .store(in: &cancellables)
        
        $pronunciationVoiceMode
            .dropFirst()
            .sink { [weak self] isOn in
                self?.contentStore.pronunciationVoiceMode = isOn
                self?.trackEvent(event: .voiceAssistance(isOn: isOn))
            }
            .store(in: &cancellables)
    }
    
    func trackEvent(event: AnalyticsProvider.SettingsAnalyticEvent) {
        self.analytics.track(event: .settings(event: event))
    }
}
