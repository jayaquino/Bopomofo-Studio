//
//  ContentProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import UIKit

public protocol ContentProvider {
    func saveHighScore(
        testType: ContentStore.TestType,
        scoreModel: ScoreModel
    ) async throws -> Bool
    
    func fetchScores(
        testType: ContentStore.TestType,
        scoreModel: ScoreModel
    ) async throws -> [ScoreModel]
    
    func fetchAllCategories() async throws -> [CategoryModel]
    
    func fetchImage(urlString: String) async throws -> UIImage?
    
    func fetchSimpleVerbs() async throws -> [VocabularyModel]
    
    func sendFeedback(description: String) async throws -> Bool
}

