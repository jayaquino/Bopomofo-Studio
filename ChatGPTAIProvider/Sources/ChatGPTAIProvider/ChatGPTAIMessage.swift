//
//  ChatGPTAIMessage.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation
import CoreBopomofoStudio

public struct ChatGPTAIMessage: Encodable {
    public let role: AISenderRole
    public let content: String
}
