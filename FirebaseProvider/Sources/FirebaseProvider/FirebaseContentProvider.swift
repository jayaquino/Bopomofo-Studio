//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import CoreBopomofoStudio

public class FirebaseContentProvider: ContentProvider {
    private let provider: FirebaseProvider
    
    public init(provider: FirebaseProvider) {
        self.provider = provider
    }
    
    public func saveHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws {
        try await provider.sendHighScore(testType: testType, scoreModel: scoreModel)
    }
    
    public func retrieveScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        try await provider.retrieveScores(testType: testType, scoreModel: scoreModel)
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        try await provider.sendFeedback(description: description)
    }
}
