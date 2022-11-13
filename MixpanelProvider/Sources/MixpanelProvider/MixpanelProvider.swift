//
//  MixpanelProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation

actor AnalyticsManager {
    
    func trackEvent(event: AnalyticEvent)
    
    enum AnalyticEvent: AnalyticTrackingProtocol {
        
        case onboarding
        case settings
        
        public var eventName: String {
            switch self {
            case .onboarding
            }
        }
        
        var parameters: [String:Any] {
            switch self {
            default:
                print("parameters")
            }
        }
    }
}

public protocol AnalyticTrackingProtocol {
    var eventName: String { get }
    var parameters: [String:Any] { get }
}
