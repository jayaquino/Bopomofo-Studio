//
//  ReviewViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 3/17/24.
//

import Foundation
import CoreBopomofoStudio

@MainActor
final class ReviewViewModel: ObservableObject {
    let contentStore: ContentStore
    
    @Published var pronunciationTextMode: Bool
    @Published var translationMode: Bool
    @Published var characterSet: ContentStore.WordCharacterSet
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
        
        self.pronunciationTextMode = contentStore.pronunciationTextMode
        self.translationMode = contentStore.translationMode
        self.characterSet = contentStore.characterSetSetting
        assignVariables()
    }
    
    private func assignVariables() {
        contentStore.$pronunciationTextMode
            .assign(to: &self.$pronunciationTextMode)
        
        contentStore.$characterSetSetting
            .assign(to: &self.$characterSet)
        
        contentStore.$translationMode
            .assign(to: &self.$translationMode)
    }
}
