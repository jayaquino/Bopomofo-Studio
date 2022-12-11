

import CoreBopomofoStudio
import UIKit

public class MockContentProvider: ContentProvider {
    public init() {}
    
    private let mockCategoryModels = [
        CategoryModel(
            categoryName: "Bopomofo",
            topicList: [
                TopicModel(
                    topicName: "Zhuyin Practice",
                    topicImage: "BPMF.png",
                    vocabulary: [
                        VocabularyModel(
                            characterSet: ["traditional" :"去", "simplified": "去"],
                            pronunciationSet: ["zhuyin": "ㄑㄩˋ", "pinyin": "qù"],
                            translation: "to go"
                        ),
                        VocabularyModel(
                            characterSet: ["traditional" :"來", "simplified": "來"],
                            pronunciationSet: ["zhuyin": "ㄌㄞˊ", "pinyin": "lái"],
                            translation: "to come"
                        )
                    ]
                ),
                TopicModel(
                    topicName: "Pinyin to Zhuyin Practice",
                    topicImage: "BPMF.png",
                    vocabulary: [
                        VocabularyModel(
                            characterSet: ["traditional" :"去", "simplified": "去"],
                            pronunciationSet: ["zhuyin": "ㄑㄩˋ", "pinyin": "qù"],
                            translation: "to go"
                        ),
                        VocabularyModel(
                            characterSet: ["traditional" :"來", "simplified": "來"],
                            pronunciationSet: ["zhuyin": "ㄌㄞˊ", "pinyin": "lái"],
                            translation: "to come"
                        )
                    ]
                )
            ]
        )
    ]
    
    private let mockUIImage = UIImage(named: "BPMF")
    
    private let mockScoreModels = [
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
    
    private let mockVocabularyModels =  [
        VocabularyModel(
            characterSet: ["traditional" :"去", "simplified": "去"],
            pronunciationSet: ["zhuyin": "ㄑㄩˋ", "pinyin": "qù"],
            translation: "to go"
        ),
        VocabularyModel(
            characterSet: ["traditional" :"來", "simplified": "來"],
            pronunciationSet: ["zhuyin": "ㄌㄞˊ", "pinyin": "lái"],
            translation: "to come"
        )
    ]


    public func fetchZhuyin() async throws -> [CoreBopomofoStudio.CategoryModel] {
        mockCategoryModels
    }
    
    public func fetchZhuyinContent() async throws -> [CoreBopomofoStudio.CategoryModel] {
        mockCategoryModels
    }
    
    public func fetchFeaturedContent() async throws -> [CategoryModel] {
        mockCategoryModels
    }
    
    public func fetchTestContent() async throws -> [CategoryModel] {
        mockCategoryModels
    }
    
    public func fetchImage(urlString: String) async throws -> UIImage? {
        mockUIImage
    }
    
    public func saveScore(topic: TopicModel, scoreModel: ScoreModel, textAssistance: Bool) async throws -> Bool {
        return true
    }
    
    public func fetchScores(topic: TopicModel, scoreModel: ScoreModel, textAssistance: Bool) async throws -> [ScoreModel] {
        mockScoreModels
    }
    
    public func sendFeedback(description: String) async throws -> Bool {
        return true
    }
    
    public func fetchSimpleVerbs() async throws -> [VocabularyModel] {
       mockVocabularyModels
    }
}
