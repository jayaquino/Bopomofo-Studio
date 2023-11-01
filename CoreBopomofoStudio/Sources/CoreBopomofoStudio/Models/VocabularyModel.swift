//
//  VocabularyModel.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/29/22.
//

import Foundation

public class VocabularyModel: Decodable, Hashable, Equatable, Identifiable {
    enum CodingKeys: CodingKey {
        case characterSet
        case pronunciationSet
        case translation
    }
    
    public let id = UUID()
    @Published public var characterSet: [String: String]
    @Published public var pronunciationSet: [String: String]
    @Published public var translation: String
    
    public init(
        characterSet: [String: String],
        pronunciationSet: [String: String],
        translation: String
    ) {
        self.characterSet = characterSet
        self.pronunciationSet = pronunciationSet
        self.translation = translation
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(translation)
    }
    
    public static func == (lhs: VocabularyModel, rhs: VocabularyModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        characterSet = try container.decode([String: String].self, forKey: .characterSet)
        pronunciationSet = try container.decode([String: String].self, forKey: .pronunciationSet)
        translation = try container.decode(String.self, forKey: .translation)
    }
}
