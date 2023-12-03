//
//  MockAIProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation
import CoreBopomofoStudio

public class MockAIProvider: AIProvider {
    
    public init() {}
    
    public let secret: String = ""
    public func sendMessage(messages: [CoreBopomofoStudio.AIMessage]) async throws -> CoreBopomofoStudio.AIResponse {
        return AIResponse(choices: [AIChatChoice(message: .init(id: UUID(), role: .assistant, content: "Hello", createdAt: Date()))])
    }
}
