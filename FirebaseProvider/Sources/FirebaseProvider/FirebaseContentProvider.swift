//
//  FirebaseContentProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import UIKit
import CoreBopomofoStudio

public class FirebaseContentProvider: ContentProvider {
    
    private let provider: FirebaseProvider
    
    public init(provider: FirebaseProvider) {
        self.provider = provider
    }
    
    public func fetchAllCategories() async throws -> [CoreBopomofoStudio.CategoryModel] {
        try await provider.fetchCategories(location: "category")
    }
    
    public func fetchImage(urlString: String) async throws -> UIImage? {
        try await provider.fetchFromStorage(urlString: urlString)
    }
    
    public func saveScore(topic: TopicModel, scoreModel: ScoreModel) async throws -> Bool {
        try await provider.addDocument(
            location: "\(topic.topicName): \(scoreModel.time)",
            data: scoreModel.dictionary
        )
    }
    
    public func fetchScores(topic: TopicModel, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        try await provider.fetchScores(location: "\(topic.topicName): \(scoreModel.time)")
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
