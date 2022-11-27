//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation

public protocol ContentProvider {
    func saveHighScore(
        testType: ContentStore.TestType,
        scoreModel: ScoreModel
    ) async throws -> Bool
    
    func retrieveScores(
        testType: ContentStore.TestType,
        scoreModel: ScoreModel
    ) async throws -> [ScoreModel]
    
    func sendFeedback(description: String) async throws -> Bool
}

