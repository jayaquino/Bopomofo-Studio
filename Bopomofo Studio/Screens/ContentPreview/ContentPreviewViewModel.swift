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
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var timerValue: Double = 30.0 {
        didSet {
            contentStore.timerValue = oldValue
        }
    }
    
    init(
        contentStore: ContentStore,
        topic: TopicModel
    ) {
        self.contentStore = contentStore
        self.topic = topic
    }
    
    func playSound(symbol: String) {
        let sound = Constants.bpmf.contains(symbol) ? symbol : PinyinHelper.convertPinyin(symbol) ?? ""
        
        switch contentStore.voiceSelection {
        case .male:
            SoundManager.instance.playMaleSound(sound: sound)
        case .female:
            SoundManager.instance.playFemaleSound(sound: sound)
        }
    }
}
