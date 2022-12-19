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
    
    public func fetchZhuyinContent() async throws -> [CategoryModel] {
        try await provider.fetchCategories(location: "zhuyin_content", type: CategoryModel.self)
    }
    
    public func fetchHomeCategoryContent() async throws -> [CategoryModel] {
        try await provider.fetchCategories(location: "home_category_content", type: CategoryModel.self)
    }
    
    public func fetchTestContent() async throws -> [CategoryModel] {
        try await provider.fetchCategories(location: "test_content", type: CategoryModel.self)
    }
    
    public func fetchImage(urlString: String) async throws -> UIImage? {
        try await provider.fetchFromStorage(urlString: urlString)
    }
    
    public func saveScore(topic: TopicModel, scoreModel: ScoreModel, textAssistance: Bool) async throws -> Bool {
        try await provider.addDocument(
            location: "\(topic.topicName): \(scoreModel.time), textAssistance \(textAssistance.description)",
            data: scoreModel.dictionary
        )
    }
    
    public func fetchScores(topic: TopicModel, scoreModel: ScoreModel, textAssistance: Bool) async throws -> [ScoreModel] {
        try await provider.fetchDocuments(location: "\(topic.topicName): \(scoreModel.time), textAssistance \(textAssistance.description)")
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
