//
//  VocabularyModel.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/29/22.
//

import Foundation

public struct VocabularyModel: Codable {
    public let id = UUID()
    public let character: String
    public let pronunciation: String
    
    public init(
        character: String,
        pronunciation: String
    ) {
        self.character = character
        self.pronunciation = pronunciation
    }
    
    public init?(data: [String: Any]) {
        guard let character = data["character"] as? String,
              let pronunciation = data["pronunciation"] as? String else {
            return nil
        }
        self.character = character
        self.pronunciation = pronunciation
    }
}
