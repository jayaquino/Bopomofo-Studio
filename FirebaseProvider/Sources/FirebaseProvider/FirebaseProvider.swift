
import CoreBopomofoStudio
import Firebase

public actor FirebaseProvider {
    public init() {}
    
    public func sendHighScore(
        testType: ContentStore.TestType,
        scoreModel: ScoreModel
    ) async throws -> Bool {
        let collection = Firestore.firestore().collection("\(testType) highscore: \(scoreModel.time)")
        return try await withCheckedThrowingContinuation({ continuation in
            collection.addDocument(data: scoreModel.dictionary) { error in
                if error != nil {
                    continuation.resume(returning: false)
                } else {
                    continuation.resume(returning: true)
                }
            }
        })
    }
    
    public func retrieveScores(
        testType: ContentStore.TestType,
        scoreModel: ScoreModel
    ) async throws -> [ScoreModel] {
        let documents = try await Firestore.firestore().collection("\(testType) highscore: \(scoreModel.time)").getDocuments()
        return documents.documents.compactMap({ ScoreModel(data: $0.data()) })
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        let collection = Firestore.firestore().collection("feedback")
        return try await withCheckedThrowingContinuation({ continuation in
            collection.addDocument(data: ["description": description]) { error in
                if error != nil {
                    continuation.resume(returning: false)
                } else {
                    continuation.resume(returning: true)
                }
            }
        })
    }
}
