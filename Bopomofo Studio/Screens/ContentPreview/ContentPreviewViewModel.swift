//
//  ContentPreviewViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import Combine
import CoreBopomofoStudio

@MainActor
class ContentPreviewViewModel: ObservableObject {
    
    let contentStore: ContentStore
    let topic: TopicModel
    @Published var pronunciationTextMode = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        contentStore: ContentStore,
        topic: TopicModel
    ) {
        self.contentStore = contentStore
        self.topic = topic
        self.assignVariables()
    }
    
    private func assignVariables() {
        contentStore.$pronunciationTextMode
            .assign(to: &self.$pronunciationTextMode)
    }
    
    func playSound(symbol: String) {
        let sound = Constants.bpmf.contains(symbol) ? symbol : LanguageHelper.convertPinyin(symbol) ?? ""
        
        switch contentStore.voiceSelection {
        case .male:
            SoundManager.instance.playMaleSound(sound: sound)
        case .female:
            SoundManager.instance.playFemaleSound(sound: sound)
        }
    }
}
