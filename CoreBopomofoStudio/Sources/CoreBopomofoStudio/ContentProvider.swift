//
//  ContentProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import UIKit

public protocol ContentProvider {
    func saveScore(
        topic: TopicModel,
        scoreModel: ScoreModel,
        textAssistance: Bool
    ) async throws -> Bool
    
    func fetchScores(
        topic: TopicModel,
        scoreModel: ScoreModel,
        textAssistance: Bool
    ) async throws -> [ScoreModel]
    
    func fetchZhuyinContent() async throws -> [CategoryModel]

    func fetchTestContent() async throws -> [CategoryModel]
    
    func fetchImage(urlString: String) async throws -> UIImage?
        
    func sendFeedback(description: String) async throws -> Bool
}

