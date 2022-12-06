//
//  VocabularyModel.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/29/22.
//

import Foundation

public class VocabularyModel: Decodable {
    enum CodingKeys: CodingKey {
        case character
        case pronunciation
    }
    
    public let id = UUID()
    @Published public var character: String
    @Published public var pronunciation: String
    
    public init(
        character: String,
        pronunciation: String
    ) {
        self.character = character
        self.pronunciation = pronunciation
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        character = try container.decode(String.self, forKey: .character)
        pronunciation = try container.decode(String.self, forKey: .pronunciation)
    }
}
