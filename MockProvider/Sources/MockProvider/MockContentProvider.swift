

import CoreBopomofoStudio
import Foundation

public class MockContentProvider: ContentProvider {

    public init() {}
    
    public func saveHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws {
    }
    
    public func retrieveScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        [
            ScoreModel(
                score: 12,
                time: 30.0
            ),
            ScoreModel(
                score: 15,
                time: 30
            ),
            ScoreModel(
                score: 25,
                time: 30.0
            ),
            ScoreModel(
                score: 30,
                time: 30
            )
        ]
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        return true
    }
}
