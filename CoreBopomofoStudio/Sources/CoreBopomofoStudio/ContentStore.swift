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
    
    public enum WordCharacterSet: String {
        case traditional
        case simplified
    }
    
    public enum WordCharacterPronunciation: String {
        case zhuyin
        case pinyin
    }
    
    @Published public var pronunciationTextMode : Bool = true
    @Published public var pronunciationVoiceMode : Bool = true
    @Published public var voiceSelection: VoiceSelection = .female
    @Published public var characterSetSetting: WordCharacterSet = .traditional
    @Published public var characterPronunciationSetting: WordCharacterPronunciation = .zhuyin
    @Published public var timerValue: Double = 30.0
    @Published public var speakingSpeed: Float = 50.0
    
    @Published public var zhuyinContent: [CategoryModel]?
    @Published public var featuredContent: [CategoryModel]?
    @Published public var hanziTestCharacterSet: [VocabularyModel]?
    
    public func fetchZhuyin() async throws {
        self.zhuyinContent = try await provider.fetchZhuyin()
    }
    
    public func fetchZhuyinContent() async throws {
        self.zhuyinContent = try await provider.fetchZhuyinContent()
    }
    
    public func fetchFeaturedContent() async throws {
        self.featuredContent = try await provider.fetchFeaturedContent()
    }
    
    public func fetchTestContent() async throws {
        guard let testContent = try await provider.fetchTestContent().first else { return }
        if self.featuredContent == nil {
            self.featuredContent = []
        }
        self.featuredContent?.append(testContent)
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
