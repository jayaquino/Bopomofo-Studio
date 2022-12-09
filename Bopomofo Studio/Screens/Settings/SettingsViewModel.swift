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
    
    @Published var voiceSelection: ContentStore.VoiceSelection
    @Published var pronunciationTextMode: Bool
    @Published var pronunciationVoiceMode: Bool
    @Published var timerValue: Double
    @Published var speakingSpeed: Float
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider
    ) {
        self.analytics = analytics
        self.contentStore = contentStore

        self.voiceSelection = contentStore.voiceSelection
        self.pronunciationTextMode = contentStore.pronunciationTextMode
        self.pronunciationVoiceMode = contentStore.pronunciationVoiceMode
        self.timerValue = contentStore.timerValue
        self.speakingSpeed = contentStore.speakingSpeed

        addSubscribers()
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
        
        $timerValue
            .dropFirst()
            .sink { [weak self] value in
                self?.contentStore.timerValue = value
            }
            .store(in: &cancellables)
        $speakingSpeed
            .dropFirst()
            .sink { [weak self] speed in
                self?.contentStore.speakingSpeed = speed
            }
            .store(in: &cancellables)
    }
    
    func trackEvent(event: AnalyticsProvider.SettingsAnalyticEvent) {
        self.analytics.track(event: .settings(event: event))
    }
}
