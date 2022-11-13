//
//  AnalyticsProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation

public protocol AnalyticTrackingProtocol {
    var eventName: String { get }
    var parameters: [String: String] { get }
}

open class AnalyticsProvider {
    
    public init() {}
    
    // Override track
    open func track(event: AnalyticEvent) { }
    
    public enum AnalyticEvent: AnalyticTrackingProtocol {
        
        case onboarding(event: OnboardingAnalyticEvent)
        case settings(event: SettingsAnalyticEvent)
        
        public var eventName: String {
            switch self {
            case
                    .onboarding(event: let event as AnalyticTrackingProtocol),
                    .settings(event: let event as AnalyticTrackingProtocol):
                
                return event.eventName
            }
        }
        
        public var parameters: [String: String] {
            switch self {
            case
                    .onboarding(event: let event as AnalyticTrackingProtocol),
                    .settings(event: let event as AnalyticTrackingProtocol):
                
                return event.parameters
            }
        }
    }
    
    // MARK: - Onboarding Analytics
    public enum OnboardingAnalyticEvent: AnalyticTrackingProtocol {
        
        case start
        
        public var eventName: String {
            switch self {
            case .start:
                return "Onboarding_Started"
            }
        }
        
        public var parameters: [String : String] {
            switch self {
            case .start:
                return [:]
            }
        }
    }
    
    // MARK: - Settings Analytics
    public enum SettingsAnalyticEvent: AnalyticTrackingProtocol {

        case textAssistance(isOn: Bool)
        case voiceAssistance(isOn: Bool)
        
        public var eventName: String {
            switch self {
            case .textAssistance:
                return "Pronunciation_Text_Assistance_Changed"
            case .voiceAssistance:
                return "Pronunciation_Voice_Assistance_Changed"
            }
        }
        
        public var parameters: [String : String] {
            switch self {
            case
                    .textAssistance(isOn: let isOn),
                    .voiceAssistance(isOn: let isOn):
                return ["isOn": isOn.description]
            }
        }
        
    }
}
