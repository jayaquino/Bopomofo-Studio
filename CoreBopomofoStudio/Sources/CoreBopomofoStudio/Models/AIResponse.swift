//
//  AIResponse.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

public struct AIResponse: Decodable {
    public let choices: [AIChatChoice]
    
    public init(choices: [AIChatChoice]) {
        self.choices = choices
    }
}
