

import CoreBopomofoStudio
import Foundation

public class MockContentProvider: ContentProvider {

    public init() {}
    
    public func fetchAllCategories() async throws -> [CoreBopomofoStudio.CategoryModel] {
        [
            CategoryModel(
                categoryName: "Bopomofo",
                topicList: [
                    TopicModel(
                        topicName: "Zhuyin Practice",
                        vocabulary: [
                            VocabularyModel(
                                character: "去",
                                pronunciation: "ㄑㄩˋ"
                            ),
                            VocabularyModel(
                                character: "來",
                                pronunciation: "ㄌㄞˊ"
                            )
                        ]
                    ),
                    TopicModel(
                        topicName: "Pinyin to Zhuyin Practice",
                        vocabulary: [
                            VocabularyModel(
                                character: "去",
                                pronunciation: "ㄑㄩˋ"
                            ),
                            VocabularyModel(
                                character: "來",
                                pronunciation: "ㄌㄞˊ"
                            )
                        ]
                    )
                ]
            )
        ]
    }
    
    public func saveHighScore(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> Bool {
        return true
    }
    
    public func fetchScores(testType: ContentStore.TestType, scoreModel: ScoreModel) async throws -> [ScoreModel] {
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
    
    public func fetchSimpleVerbs() async throws -> [VocabularyModel] {
        [
            VocabularyModel(
                character: "去",
                pronunciation: "ㄑㄩˋ"
            ),
            VocabularyModel(
                character: "來",
                pronunciation: "ㄌㄞˊ"
            )
        ]
    }
}
