//
//  File.swift
//  
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation

public struct ScoreModel: Codable {
    public let score : Int
    public let time: Double
    public var dictionary: [String: Any] {
        return ["score": score,
                "time": time]
    }
    
    public init(
        score: Int,
        time: Double
    ) {
        self.score = score
        self.time = time
    }
    
    public init?(data: [String: Any]) {
        guard let score = data["score"] as? Int,
              let time = data["time"] as? Double else {
            return nil
        }
        self.score = score
        self.time = time
    }
}
