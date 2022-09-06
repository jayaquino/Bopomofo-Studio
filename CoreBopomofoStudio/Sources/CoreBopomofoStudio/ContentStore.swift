//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation

public class ContentStore {
    private let provider: ContentProvider

    public init(provider: ContentProvider) {
        self.provider = provider
    }
    
    public enum TestType: String, CaseIterable {
        case zhuyin = "Zhuyin"
        case pinyinToZhuyin = "Pinyin To Zhuyin"
    }
    
    public enum VoiceSelection: String, CaseIterable {
        case female = "Female"
        case male = "Male"
    }
    
    public let testList = TestList()
    @Published public var testType: TestType = .zhuyin
    @Published public var pronunciationTextMode : Bool = false
    @Published public var pronunciationVoiceMode : Bool = false
    @Published public var voiceSelection: VoiceSelection = .female
    @Published public var timerValue: Double = 30.0
    @Published public var contentOne : [String] = []
    @Published public var contentTwo : [String] = []
    @Published public var testId : String = ""
    
    public func saveHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws {
        try await provider.saveHighScore(testType: testType, scoreModel: scoreModel)
    }
    
    public func retrieveScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        try await provider.retrieveScores(testType: testType, scoreModel: scoreModel)
    }
    
}
