//
//  AIProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

public protocol AIProvider {
    var secret: String { get }
    func sendMessage(messages: [AIMessage]) async throws -> AIResponse
}
