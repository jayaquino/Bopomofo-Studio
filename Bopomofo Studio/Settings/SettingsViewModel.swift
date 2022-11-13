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
    
    @Published var testType: ContentStore.TestType = .zhuyin
    @Published var voiceSelection: ContentStore.VoiceSelection = .female
    @Published var pronunciationTextMode: Bool = false
    @Published var pronunciationVoiceMode: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
        self.testType = contentStore.testType
        self.voiceSelection = contentStore.voiceSelection
        self.pronunciationTextMode = contentStore.pronunciationTextMode
        self.pronunciationVoiceMode = contentStore.pronunciationVoiceMode
        
        addSubscribers()
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
            }
            .store(in: &cancellables)
        
        $pronunciationTextMode
            .sink { value in
                self.contentStore.pronunciationTextMode = value
            }
            .store(in: &cancellables)
        
        $pronunciationVoiceMode
            .sink { value in
                self.contentStore.pronunciationVoiceMode = value
            }
            .store(in: &cancellables)
    }
}
