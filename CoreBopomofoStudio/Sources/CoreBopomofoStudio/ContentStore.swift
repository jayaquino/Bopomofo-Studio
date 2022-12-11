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
    
    public enum WordCharacterSet: String, CaseIterable {
        case traditional
        case simplified
    }
    
    public enum WordCharacterPronunciation: String {
        case zhuyin
        case pinyin
    }
    
    @Published public var pronunciationTextMode : Bool = false
    @Published public var pronunciationVoiceMode : Bool = true
    @Published public var translationMode: Bool = true
    @Published public var voiceSelection: VoiceSelection = .female
    @Published public var characterSetSetting: WordCharacterSet = .traditional
    @Published public var characterPronunciationSetting: WordCharacterPronunciation = .zhuyin
    @Published public var timerValue: Double = 30.0
    @Published public var speakingSpeed: Float = 50.0
    
    @Published public var heroContent: [CategoryModel]?
    @Published public var homeCategoryContent: [CategoryModel]?
    @Published public var hanziTestCharacterSet: [VocabularyModel]?
    
    public func fetchZhuyinContent() async throws {
        self.heroContent = try await provider.fetchZhuyinContent()
    }
    
    public func fetchHomeCategoryContent() async throws {
        self.homeCategoryContent = try await provider.fetchHomeCategoryContent()
    }
    
    public func fetchTestContent() async throws {
        guard let testContent = try await provider.fetchTestContent().first else { return }
        if self.homeCategoryContent == nil {
            self.homeCategoryContent = []
        }
        self.homeCategoryContent?.append(testContent)
    }

    public func fetchImage(urlString: String) async throws -> UIImage? {
        try await provider.fetchImage(urlString: urlString)
    }
    
    @discardableResult
    public func saveScore(topic: TopicModel, scoreModel: ScoreModel) async throws -> Bool {
        try await provider.saveScore(topic: topic, scoreModel: scoreModel, textAssistance: pronunciationTextMode)
    }
    
    public func fetchScores(topic: TopicModel, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        try await provider.fetchScores(topic: topic, scoreModel: scoreModel, textAssistance: pronunciationTextMode)
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        try await provider.sendFeedback(description: description)
    }
}
