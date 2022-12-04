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
        scoreModel: ScoreModel
    ) async throws -> Bool
    
    func fetchScores(
        topic: TopicModel,
        scoreModel: ScoreModel
    ) async throws -> [ScoreModel]
    
    func fetchZhuyinContent() async throws -> [CategoryModel]
    
    func fetchFeaturedContent() async throws -> [CategoryModel]
    
    func fetchImage(urlString: String) async throws -> UIImage?
        
    func sendFeedback(description: String) async throws -> Bool
}

