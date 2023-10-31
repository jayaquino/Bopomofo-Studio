//
//  AIResponse.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

public struct AIResponse: Decodable {
    let choices: [AIChatChoice]
}
