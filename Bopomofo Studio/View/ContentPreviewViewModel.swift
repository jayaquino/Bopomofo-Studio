//
//  ContentPreviewViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import Combine
import CoreBopomofoStudio

class ContentPreviewViewModel: ObservableObject {
    
    let contentStore: ContentStore
    
    @Published var timerValue: Double = 30.0 {
        didSet {
            contentStore.timerValue = oldValue
        }
    }
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
    }
    
}
