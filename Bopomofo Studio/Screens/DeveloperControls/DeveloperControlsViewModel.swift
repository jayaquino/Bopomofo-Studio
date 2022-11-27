//
//  DeveloperControlsViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/26/22.
//

import Foundation
import Combine

class DeveloperControlsViewModel: ObservableObject {
    @Published var didSeeOnboarding = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
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
    }
    
    func resetDidSeeOnboarding() {
        UserDefaults.didSeeOnboarding = false
    }
}
