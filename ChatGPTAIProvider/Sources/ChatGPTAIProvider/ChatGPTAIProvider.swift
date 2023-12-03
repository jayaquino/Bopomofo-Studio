import CoreBopomofoStudio
import Alamofire

public final class ChatGPTAIProvider: AIProvider {
    private let endpointURL = "https://api.openai.com/v1/chat/completions"
    public let secret: String
    
    public init(secret: String) {
        self.secret = secret
    }
    
    public func sendMessage(messages: [AIMessage]) async throws -> AIResponse {
        
        let chatGPTAIMessages = messages.map({ ChatGPTAIMessage(role: $0.role, content: $0.content) })
        let body = ChatGPTAIBody(model: "gpt-3.5-turbo", messages: chatGPTAIMessages)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(secret)"
        ]
        
        return try await AF.request(endpointURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(AIResponse.self).value
    }
}
