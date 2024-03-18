//
//  Topic Model.swift
//  
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import Foundation

public class TopicModel: Decodable, Hashable, Equatable {
    enum CodingKeys: CodingKey {
        case topicName
        case topicImage
        case vocabulary
    }
    
    public let id = UUID()
    @Published public var topicName: String
    @Published public var topicImage: String
    @Published public var vocabulary: [VocabularyModel]
    
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        topicName = try container.decode(String.self, forKey: .topicName)
        topicImage = try container.decode(String.self, forKey: .topicImage)
        vocabulary = try container.decode([VocabularyModel].self, forKey: .vocabulary)
    }
    
    public var isReview: Bool {
        self.topicName == "Review"
    }
}
