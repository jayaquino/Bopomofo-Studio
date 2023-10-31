//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

public struct AIChatChoice: Decodable {
    public let message: AIMessage
    
    public init(message: AIMessage) {
        self.message = message
    }
}
