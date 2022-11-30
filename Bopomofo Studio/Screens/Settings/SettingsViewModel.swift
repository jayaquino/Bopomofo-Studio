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
    
    @Published var testType: ContentStore.TestType = .zhuyin
    @Published var voiceSelection: ContentStore.VoiceSelection = .female
    @Published var pronunciationTextMode = false
    @Published var pronunciationVoiceMode = false
    @Published var feedback = ""
    @Published var showAlert = false
    
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
            .dropFirst()
            .sink { [weak self] testType in
                self?.contentStore.testType = testType
                self?.trackEvent(event: .testType(testType: testType.rawValue))
            }
            .store(in: &cancellables)
        
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
    
    func sendFeedback() {
        guard !feedback.isEmpty else { return }
        Task {
            trackEvent(event: .feedbackSendButtonTapped)
            let success = try await contentStore.sendFeedback(description: feedback)
            if success {
                feedback = ""
                showAlert = true
            }
        }
    }
    
    func trackEvent(event: AnalyticsProvider.SettingsAnalyticEvent) {
        self.analytics.track(event: .settings(event: event))
    }
}
