//
//  FlashcardViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/2/22.
//

import Foundation
import CoreBopomofoStudio

class FlashcardViewModel: ObservableObject {
    var contentStore: ContentStore
    
    @Published private var characterSet: [VocabularyModel]?
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
    }
    
    private func assignVariables() {
        self.contentStore.$hanziTestCharacterSet
            .assign(to: &self.$characterSet)
    }
    
    func test() {
        print("Character set appearing")
    }
}
