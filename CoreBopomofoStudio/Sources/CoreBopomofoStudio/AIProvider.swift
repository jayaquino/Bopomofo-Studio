//
//  AIProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 10/30/23.
//

import Foundation

public protocol AIProvider {
    func sendMessage(messages: [AIMessage]) async -> AIResponse?
}
