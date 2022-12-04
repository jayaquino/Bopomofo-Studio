//
//  FirebaseContentProvider.swift
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
    
    public func fetchAllCategories() async throws -> [CoreBopomofoStudio.CategoryModel] {
        throw DevelopmentError.notImplemented
    }
    
    public func saveHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> Bool {
        try await provider.addDocument(
            location: "\(testType) highscore: \(scoreModel.time)",
            data: scoreModel.dictionary
        )
    }
    
    public func fetchScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        try await provider.fetchScores(location: "\(testType) highscore: \(scoreModel.time)")
    }
    
    public func fetchSimpleVerbs() async throws -> [VocabularyModel] {
        try await provider.fetchVocabulary(location: "simple_verbs")
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        try await provider.addDocument(
            location: "feedback",
            data: ["description": description]
        )
    }
    
    enum DevelopmentError: Error {
        case notImplemented
    }
}
