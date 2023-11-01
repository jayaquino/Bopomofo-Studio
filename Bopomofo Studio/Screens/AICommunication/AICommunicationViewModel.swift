//
//  AICommunicationViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 10/31/23.
//

import Foundation
import CoreBopomofoStudio

@MainActor
final class AICommunicationViewModel: ObservableObject {
    let vocabulary: VocabularyModel
    let topic: TopicModel
    private let aiStore: AIStore
    private let contentStore: ContentStore
    
    @Published private(set) var characterSetSetting: ContentStore.WordCharacterSet = .traditional
    @Published private(set) var messages: [AIMessage] = []
    @Published private(set) var messagesToPresent: [AIMessage] = []
    @Published private(set) var isFetching = false

    enum CommunicationRequest: String, CaseIterable, Identifiable {
        case example
        case anotherExample
        
        var title: String {
            switch self {
            case .example: return "Give me an example"
            case .anotherExample: return "Another example"
            }
        }
        
        var requestString: String {
            switch self {
            case .example: return "give a beginner learner example sentence using this Chinese character with pinyin and translation provided: "
            case .anotherExample: return "give me another similar difficulty example"
            }
        }
        
        var id: String {
            self.rawValue
        }
    }
    
    init(vocabulary: VocabularyModel, topic: TopicModel, aiStore: AIStore, contentStore: ContentStore) {
        self.vocabulary = vocabulary
        self.topic = topic
        self.aiStore = aiStore
        self.contentStore = contentStore
        
        assignVariables()
    }
    
    private func assignVariables() {
        contentStore.$characterSetSetting
            .assign(to: &self.$characterSetSetting)
    }
    
    var character: String {
        self.vocabulary.characterSet[characterSetSetting.rawValue] ?? ""
    }
    
    func sendMessage(input: CommunicationRequest) async throws {
        let modifiedInput = "Using \(characterSetSetting.rawValue) Chinese characters in the example, \(input.requestString) \(character) with the meaning of '\(vocabulary.translation)'"
        let newMessage = AIMessage(id: UUID(), role: .user, content: modifiedInput, createdAt: Date())
        messages.append(newMessage)
        
        let response = try await aiStore.sendMessage(messages: messages)
        guard let receivedAIMessage = response.choices.first?.message else { return }
        let receivedMessage = AIMessage(id: UUID(), role: receivedAIMessage.role, content: receivedAIMessage.content, createdAt: Date())
        messages.append(receivedMessage)
        messagesToPresent.append(receivedMessage)
    }
    
    func requestButtonTapped(input: CommunicationRequest) {
        Task {
            do {
                self.isFetching = true
                try await self.sendMessage(input: input)
            } catch {
                print("error", error.localizedDescription)
            }
            self.isFetching = false
        }
    }
    
    func checkIfMessageIsFromUser(_ message: AIMessage) -> Bool {
        return CommunicationRequest.allCases.map({ $0.requestString }).contains(message.content)
    }
    
    func extractChineseCharactersAndPlaySound(from inputString: String) {
        let regexPattern = "[\\p{Script=Han}]+"
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: [])
            let nsString = inputString as NSString
            let matches = regex.matches(in: inputString, options: [], range: NSRange(location: 0, length: nsString.length))
            
            var chineseCharacters = ""
            for match in matches {
                let range = match.range
                chineseCharacters += nsString.substring(with: range)
            }
            
            SoundManager.instance.utterSound(
                sound: chineseCharacters,
                rate: contentStore.speakingSpeed
            )
        } catch {
            print("Error in regular expression: \(error)")
        }
    }
}
