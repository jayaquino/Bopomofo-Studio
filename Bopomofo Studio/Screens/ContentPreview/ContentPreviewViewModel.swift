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
    let analytics: AnalyticsProvider
    
    let topic: TopicModel
    @Published var pronunciationTextMode: Bool
    @Published var translationMode: Bool
    @Published var characterSet: ContentStore.WordCharacterSet
    @Published var selectedVocabulary: VocabularyModel?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider,
        topic: TopicModel
    ) {
        self.contentStore = contentStore
        self.analytics = analytics
        self.topic = topic
        
        self.pronunciationTextMode = contentStore.pronunciationTextMode
        self.translationMode = contentStore.translationMode
        self.characterSet = contentStore.characterSetSetting
        self.assignVariables()
    }
    
    private func assignVariables() {
        contentStore.$pronunciationTextMode
            .assign(to: &self.$pronunciationTextMode)
        
        contentStore.$characterSetSetting
            .assign(to: &self.$characterSet)
        
        contentStore.$translationMode
            .assign(to: &self.$translationMode)
    }
    
    func playSound(symbol: String) {
        if !UserDefaults.didPlayASoundAtLeastOnce {
            UserDefaults.didPlayASoundAtLeastOnce = true
        }
        
        let sound = Constants.bpmf.contains(symbol) ? symbol : LanguageHelper.convertPinyin(symbol) ?? ""
        
        if LanguageHelper.isZhuyinOrPinyin(symbol) {
            switch contentStore.voiceSelection {
            case .male:
                SoundManager.instance.playMaleSound(sound: sound)
            case .female:
                SoundManager.instance.playFemaleSound(sound: sound)
            }
        } else {
            SoundManager.instance.utterSound(
                sound: symbol,
                rate: contentStore.speakingSpeed
            )
        }
    }
    
    func trackEvent(event: AnalyticsProvider.ContentPreviewAnalyticEvent) {
        self.analytics.track(event: .contentPreview(event: event))
    }
}
