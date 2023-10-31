//
//  ChatGPTAIMessage.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

struct ChatGPTAIMessage: Encodable {
    let role: ChatGPTAISenderRole
    let content: String
}
