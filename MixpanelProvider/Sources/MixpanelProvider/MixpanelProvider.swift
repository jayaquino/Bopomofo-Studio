//
//  MixpanelProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation
import CoreBopomofoStudio
import Mixpanel

public class MixpanelProvider: AnalyticsProvider {
    
    public init() {}
    
    private var mixpanelInstance: MixpanelInstance {
        Mixpanel.mainInstance()
    }
    
    public func track(event: AnalyticEvent) {
        Task {
            mixpanelInstance.track(
                event: event.eventName,
                properties: event.parameters
            )
        }
    }
    
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
}

// MARK: - Onboarding Analytics
extension MixpanelProvider {
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
}

// MARK: - Settings Analytics
extension MixpanelProvider {
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
