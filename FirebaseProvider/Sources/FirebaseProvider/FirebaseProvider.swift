
import CoreBopomofoStudio
import Firebase
import FirebaseStorage
import FirebaseDatabase
import UIKit

public actor FirebaseProvider {
    
    let ref = Database.database().reference()
    
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
    
    public func fetchFromStorage(urlString: String) async throws -> UIImage? {
        let reference = Storage.storage().reference(withPath: urlString)
        
        return try await withCheckedThrowingContinuation({ continuation in
            reference.getData(maxSize: (1 * 1024 * 1024)) { (data, error) in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: UIImage(data: data!))
                }
            }
        })
    }
    
    public func fetchCategories<T: Codable>(location: String, type: T.Type) async throws -> [T] {
        do {
            let data = try await ref.child(location).getData()
            guard let dict = data.value as? [String: Any] else {
                throw URLError(.cannotDecodeRawData)
            }
            
            do {
                let values = dict.map({ $0.value })
                let json = try JSONSerialization.data(withJSONObject: values)
                return try JSONDecoder().decode([T].self, from: json)
            } catch let error {
                throw error
            }
        } catch {
            print("Error in fetching categories", error)
            throw error
        }
    }
}
