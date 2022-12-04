//
//  FlashcardViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/2/22.
//

import Foundation
import CoreBopomofoStudio

@MainActor
class FlashcardViewModel: ObservableObject {
    var contentStore: ContentStore
    
    @Published var characterSet: [VocabularyModel]?
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
        self.assignVariables()
    }
    
    private func assignVariables() {
        self.contentStore.$hanziTestCharacterSet
            .assign(to: &self.$characterSet)
    }
}
