//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import Foundation

public struct CategoryModel: Codable, Hashable {
    enum CodingKeys: CodingKey {
        case categoryName
        case topicList
    }
    
    public let id = UUID()
    public let categoryName: String
    public let topicList: [TopicModel]
    
    public init(
        categoryName: String,
        topicList: [TopicModel]
    ) {
        self.categoryName = categoryName
        self.topicList = topicList
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        categoryName = try container.decode(String.self, forKey: .categoryName)
        topicList = try container.decode([TopicModel].self, forKey: .topicList)
    }
    
    public static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(categoryName)
    }
}
