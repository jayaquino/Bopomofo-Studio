//
//  AIStore.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

@MainActor
public class AIStore: ObservableObject {
    private let provider: AIProvider
    
    public init(provider: AIProvider) {
        self.provider = provider
    }
}
