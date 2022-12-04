//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import Foundation

public struct TopicModel: Codable, Hashable, Equatable {
    public let id = UUID()
    public let topicName: String
    public let topicImage: String
    public let vocabulary: [VocabularyModel]
    
    public init(
        topicName: String,
        topicImage: String,
        vocabulary: [VocabularyModel]
    ) {
        self.topicName = topicName
        self.topicImage = topicImage
        self.vocabulary = vocabulary
    }
    
    public static func == (lhs: TopicModel, rhs: TopicModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(topicName)
    }
}
