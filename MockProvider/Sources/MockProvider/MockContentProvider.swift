

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
                    topicImage: "BPMF.png",
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
            character: "去",
            pronunciation: "ㄑㄩˋ"
        ),
        VocabularyModel(
            character: "來",
            pronunciation: "ㄌㄞˊ"
        )
    ]


    public func fetchZhuyinContent() async throws -> [CoreBopomofoStudio.CategoryModel] {
        mockCategoryModels
    }
    
    public func fetchFeaturedContent() async throws -> [CategoryModel] {
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
