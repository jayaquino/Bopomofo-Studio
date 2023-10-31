//
//  ChatGPTAIBody.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

struct ChatGPTAIBody: Encodable {
    let model: String
    let messages: [ChatGPTAIMessage]
}
