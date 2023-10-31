//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

public struct AIMessage: Decodable {
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
}
