
import CoreBopomofoStudio
import Firebase

public actor FirebaseProvider {
    public init() {}
    
    public func addDocument(
        location: String,
        data: [String: Any]
    ) async throws -> Bool {
        let collection = Firestore.firestore().collection(location)
        return try await withCheckedThrowingContinuation({ continuation in
            collection.addDocument(data: data) { error in
                if error != nil {
                    continuation.resume(returning: false)
                } else {
                    continuation.resume(returning: true)
                }
            }
        })
    }
    
    public func fetchScores(location: String) async throws -> [ScoreModel] {
        let documents = try await Firestore.firestore().collection(location).getDocuments()
        return documents.documents.compactMap({ ScoreModel(data: $0.data()) })
    }
    
    public func fetchVocabulary(location: String) async throws -> [VocabularyModel] {
        let documents = try await Firestore.firestore().collection(location).getDocuments()
        return documents.documents.compactMap({ VocabularyModel(data: $0.data()) })
    }
    
    // TODO: Convert to generic
//    public func loadDocuments<Document: Decodable>(location: String, data: Document) async throws -> [Document] {
//        let documents = try await Firestore.firestore().collection(location).getDocuments()
//        let documentDictionary = documents.documents.compactMap({ $0.data() })
//        let json = try JSONSerialization.data(withJSONObject: documentDictionary)
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let decoded = try decoder.decode([Document].self, from: json)
//        return decoded
//    }
}
