//
//  VocabularyModel.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/29/22.
//

import Foundation
import SwiftData

@Model
public class VocabularyModel: Decodable, Hashable, Equatable, Identifiable {
    enum CodingKeys: CodingKey {
        case characterSet
        case pronunciationSet
        case translation
    }
    
    public let id = UUID()
    public var characterSet: [String: String]
    public var pronunciationSet: [String: String]
    public var translation: String
    
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
