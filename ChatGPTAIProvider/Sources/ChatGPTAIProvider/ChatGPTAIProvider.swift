import CoreBopomofoStudio
import Alamofire

public final class ChatGPTAIProvider: AIProvider {
    private let endpointURL = "https://api.openai.com/v1/chat/completions"
    private let openAIKey = "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"

    public func sendMessage(messages: [AIMessage]) async -> AIResponse? {
        
        let chatGPTAIMessages = messages.map({ ChatGPTAIMessage(role: $0.role, content: $0.content) })
        let body = ChatGPTAIBody(model: "gpt-3.5-turbo", messages: chatGPTAIMessages)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(openAIKey)"
        ]
        
        return try? await AF.request(endpointURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(AIResponse.self).value
    }
}
