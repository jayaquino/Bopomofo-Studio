
import CoreBopomofoStudio
import Firebase

public actor FirebaseProvider {
    public init() {}
    
    public func sendHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) {
        let collection = Firestore.firestore().collection("\(testType) highscore: \(scoreModel.time)")
        collection.addDocument(data: scoreModel.dictionary)
    }
    
    public func retrieveScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
        let documents = try await Firestore.firestore().collection("\(testType) highscore: \(scoreModel.time)").getDocuments()
        return documents.documents.compactMap({ ScoreModel(data: $0.data()) })
    }
}
