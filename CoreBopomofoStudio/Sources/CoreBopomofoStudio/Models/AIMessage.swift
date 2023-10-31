//
//  AIMessage.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

public struct AIMessage: Decodable, Hashable {
    public let id: UUID
    public let role: AISenderRole
    public let content: String
    public let createdAt: Date
    
    public init(
        id: UUID,
        role: AISenderRole,
        content: String,
        createdAt: Date
    ) {
        self.id = id
        self.role = role
        self.content = content
        self.createdAt = createdAt
    }
    
    
    enum CodingKeys: String, CodingKey {
        case role
        case content
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = UUID()
        role = try values.decode(AISenderRole.self, forKey: .role)
        content = try values.decode(String.self, forKey: .content)
        createdAt = Date()
    }
}
