
import CoreBopomofoStudio
import Firebase

public actor FirebaseProvider {
    public init() {}
    
    public func sendHighScore(
        testType: ContentStore.TestType,
        scoreModel: ScoreModel
    ) {
        let collection = Firestore.firestore().collection("\(testType) highscore: \(scoreModel.time)")
        collection.addDocument(data: scoreModel.dictionary)
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
                if let error {
                    continuation.resume(returning: false)
                } else {
                    continuation.resume(returning: true)
                }
            }
        })
    }
}
