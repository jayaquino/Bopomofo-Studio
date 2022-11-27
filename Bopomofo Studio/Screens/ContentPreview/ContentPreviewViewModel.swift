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
    @Published var testKeys: [String]
    @Published var testValues: [String]
    @Published var testType: ContentStore.TestType = .zhuyin
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var timerValue: Double = 30.0 {
        didSet {
            contentStore.timerValue = oldValue
        }
    }
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore
        self.testKeys = contentStore.testType.dictionary.map({ $0.key })
        self.testValues = contentStore.testType.dictionary.map({ $0.value })
        
        contentStore.$testType
            .sink { [weak self] testType in
                self?.testType = testType
                self?.testKeys = testType.dictionary.map({ $0.key})
                self?.testValues = testType.dictionary.map({ $0.value })
            }
            .store(in: &cancellables)
    }
    
}
