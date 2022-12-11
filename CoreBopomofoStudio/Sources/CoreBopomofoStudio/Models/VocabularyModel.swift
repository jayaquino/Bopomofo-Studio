//
//  VocabularyModel.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/29/22.
//

import Foundation

public class VocabularyModel: Decodable {
    enum CodingKeys: CodingKey {
        case characterSet
        case zhuyin
        case pinyin
        case translation
    }
    
    public let id = UUID()
    @Published public var characterSet: [String: String]
    @Published public var zhuyin: String
    @Published public var pinyin: String
    @Published public var translation: String
    
    public init(
        characterSet: [String: String],
        zhuyin: String,
        pinyin: String,
        translation: String
    ) {
        self.characterSet = characterSet
        self.zhuyin = zhuyin
        self.pinyin = pinyin
        self.translation = translation
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        characterSet = try container.decode([String: String].self, forKey: .characterSet)
        zhuyin = try container.decode(String.self, forKey: .zhuyin)
        pinyin = try container.decode(String.self, forKey: .pinyin)
        translation = try container.decode(String.self, forKey: .translation)
    }
}
