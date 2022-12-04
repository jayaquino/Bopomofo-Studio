//
//  ContentStore.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import Combine
import UIKit

@MainActor
public class ContentStore: ObservableObject {
    private let provider: ContentProvider
    
    public init(provider: ContentProvider) {
        self.provider = provider
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    public enum VoiceSelection: String, CaseIterable {
        case female = "Female"
        case male = "Male"
    }
    
    public enum CharacterCardSet: String, CaseIterable {
        case simple_verbs
    }
    
    @Published public var pronunciationTextMode : Bool = false
    @Published public var pronunciationVoiceMode : Bool = false
    @Published public var voiceSelection: VoiceSelection = .female
    @Published public var timerValue: Double = 30.0
    @Published public var contentOne : [String] = []
    @Published public var contentTwo : [String] = []
    @Published public var testId : String = ""
    
    @Published public var allContent: [CategoryModel]?
    @Published public var hanziTestCharacterSet: [VocabularyModel]?
    @Published public var hanziTest: CharacterCardSet = .simple_verbs
    
    public func fetchAllCategories() async throws {
        self.allContent = try await provider.fetchAllCategories()
    }
    
    public func fetchImage(urlString: String) async throws -> UIImage? {
        try await provider.fetchImage(urlString: urlString)
    }
    
    @discardableResult
    public func saveScore(topic: TopicModel, scoreModel: ScoreModel) async throws -> Bool {
        try await provider.saveScore(topic: topic, scoreModel: scoreModel)
    }
    
    public func fetchScores(topic: TopicModel, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        try await provider.fetchScores(topic: topic, scoreModel: scoreModel)
    }
    
    public func fetchVocab() async throws {
        switch hanziTest {
        case .simple_verbs:
            self.hanziTestCharacterSet = try await provider.fetchSimpleVerbs()
        }
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        try await provider.sendFeedback(description: description)
    }
}
