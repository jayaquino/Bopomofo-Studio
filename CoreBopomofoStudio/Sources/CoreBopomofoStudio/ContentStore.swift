//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation

public class ContentStore: ObservableObject {
    private let provider: ContentProvider
    
    public init(provider: ContentProvider) {
        self.provider = provider
    }
    
    public enum TestType: String, CaseIterable {
        case zhuyin = "Zhuyin"
        case pinyinToZhuyin = "Pinyin To Zhuyin"
        
        public var dictionary: [String: String] {
            switch self {
            case .zhuyin:
                return ["ㄅ": "b in boy",
                        "ㄆ": "p in pout",
                        "ㄇ": "m in mom",
                        "ㄈ": "f in fat",
                        "ㄉ": "d in dad",
                        "ㄊ": "t in tone",
                        "ㄋ": "n in no",
                        "ㄌ": "l in low",
                        "ㄍ": "g in iguana",
                        "ㄎ": "k in kit",
                        "ㄏ": "h in how",
                        "ㄐ": "j in june",
                        "ㄑ": "ch in chew",
                        "ㄒ": "sh in sheesh",
                        "ㄓ": "je in jerk",
                        "ㄔ": "ch in choke",
                        "ㄕ": "sh in shot",
                        "ㄖ": "r in drought",
                        "ㄗ": "z in zip",
                        "ㄘ": "ts in cats",
                        "ㄙ": "s in soon",
                        "ㄧ": "i in iguana",
                        "ㄨ": "u in iguana",
                        "ㄩ": "ü in june",
                        "ㄚ": "a in fat",
                        "ㄛ": "aw in law",
                        "ㄜ": "uh in duh",
                        "ㄝ": "e in yet",
                        "ㄞ": "igh in sigh",
                        "ㄟ": "ay in lay",
                        "ㄠ": "ow in cow",
                        "ㄡ": "ow in row",
                        "ㄢ": "an in iguana",
                        "ㄣ": "en in pen",
                        "ㄤ": "ang in sangria",
                        "ㄥ": "ngue in tongue",
                        "ㄦ": "ur in fur"]
            case .pinyinToZhuyin:
                return ["b": "ㄅ b in boy",
                        "p": "ㄆ p in pout",
                        "m": "ㄇ m in mom",
                        "f": "ㄈ f in fat",
                        "d": "ㄉ d in dad",
                        "t": "ㄊ t in tone",
                        "n": "ㄋ n in no",
                        "l": "ㄌ l in low",
                        "g": "ㄍ g in iguana",
                        "k": "ㄎ k in kit",
                        "h": "ㄏ h in how",
                        "j": "ㄐ j in june",
                        "q": "ㄑ ch in chew",
                        "x": "ㄒ sh in sheesh",
                        "zh": "ㄓ je in jerk",
                        "ch": "ㄔ ch in choke",
                        "sh": "ㄕ sh in shot",
                        "r": "ㄖ r in drought",
                        "z": "ㄗ z in zip",
                        "c": "ㄘ ts in cats",
                        "s": "ㄙ s in soon",
                        "i": "ㄧ i in iguana",
                        "u": "ㄨ u in iguana",
                        "uu": "ㄩ ü in june",
                        "a": "ㄚ a in fat",
                        "o": "ㄛ aw in law",
                        "eh": "ㄜ uh in duh",
                        "e": "ㄝ e in yet",
                        "ai": "ㄞ igh in sigh",
                        "ei": "ㄟ ay in lay",
                        "ao": "ㄠ ow in cow",
                        "ou": "ㄡ ow in row",
                        "an": "ㄢ an in iguana",
                        "en": "ㄣ en in pen",
                        "ang": "ㄤ ang in sangria",
                        "eng": "ㄥ ngue in tongue",
                        "er": "ㄦ ur in fur"]
            }
        }
        
        public var pinyinDictionary : [String: String] { ["b":"ㄅ","p":"ㄆ","m":"ㄇ","f":"ㄈ","d":"ㄉ","t":"ㄊ","n":"ㄋ","l":"ㄌ","g":"ㄍ","k":"ㄎ","h":"ㄏ","j":"ㄐ","q":"ㄑ","x":"ㄒ","zh":"ㄓ","ch":"ㄔ","sh":"ㄕ","r":"ㄖ","z":"ㄗ","c":"ㄘ","s":"ㄙ","i":"ㄧ","u":"ㄨ","uu":"ㄩ","a":"ㄚ","o":"ㄛ","eh":"ㄜ","e":"ㄝ","ai":"ㄞ","ei":"ㄟ","ao":"ㄠ","ou":"ㄡ","an":"ㄢ","en":"ㄣ","ang":"ㄤ","eng":"ㄥ","er":"ㄦ"]
        }
    }
    
    public enum VoiceSelection: String, CaseIterable {
        case female = "Female"
        case male = "Male"
    }
    
    @Published public var testType: TestType = .zhuyin
    @Published public var pronunciationTextMode : Bool = false
    @Published public var pronunciationVoiceMode : Bool = false
    @Published public var voiceSelection: VoiceSelection = .female
    @Published public var timerValue: Double = 30.0
    @Published public var contentOne : [String] = []
    @Published public var contentTwo : [String] = []
    @Published public var testId : String = ""
    
    @discardableResult
    public func saveHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> Bool {
        try await provider.saveHighScore(testType: testType, scoreModel: scoreModel)
    }
    
    public func retrieveScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        try await provider.retrieveScores(testType: testType, scoreModel: scoreModel)
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        try await provider.sendFeedback(description: description)
    }
}
