//
//  DeveloperControlsViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/26/22.
//

import Foundation
import Combine
import CoreBopomofoStudio

@MainActor
class DeveloperControlsViewModel: ObservableObject {
    let contentStore: ContentStore
    
    @Published var didSeeOnboarding = false
    @Published var timerOverride = false
    @Published var soundTipOverride = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
        addSubscribers()
    }
    
    private func addSubscribers() {
        $didSeeOnboarding
            .sink { [weak self] didSeeOnboarding in
                if didSeeOnboarding {
                    self?.resetDidSeeOnboarding()
                }
            }
            .store(in: &cancellables)
        
        $timerOverride
            .sink { [weak self] timerOverride in
                self?.overrideTestTimerToFiveSeconds()
            }
            .store(in: &cancellables)
        
        $soundTipOverride
            .sink { [weak self] soundTipOverride in
                self?.overrideDidPlaySoundAtLeastOnce()
            }
            .store(in: &cancellables)
    }
    
    func resetDidSeeOnboarding() {
        UserDefaults.didSeeOnboarding = false
    }
    
    func overrideTestTimerToFiveSeconds() {
        contentStore.timerValue = 5
    }
    
    func overrideDidPlaySoundAtLeastOnce() {
        UserDefaults.didPlayASoundAtLeastOnce = false
    }
}
