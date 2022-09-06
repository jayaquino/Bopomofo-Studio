

import CoreBopomofoStudio
import Foundation

public class MockContentProvider: ContentProvider {

    public init() {}
    
    public func saveHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws {
    }
    
    public func retrieveScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        throw URLError(.badURL)
    }
}
