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
        case test(event: TestAnalyticEvent)
        
        public var eventName: String {
            switch self {
            case
                    .onboarding(event: let event as AnalyticTrackingProtocol),
                    .settings(event: let event as AnalyticTrackingProtocol),
                    .test(event: let event as AnalyticTrackingProtocol):
                
                return event.eventName
            }
        }
        
        public var parameters: [String: String] {
            switch self {
            case
                    .onboarding(event: let event as AnalyticTrackingProtocol),
                    .settings(event: let event as AnalyticTrackingProtocol),
                    .test(event: let event as AnalyticTrackingProtocol):
                
                return event.parameters
            }
        }
    }
    
    // MARK: - Settings Analytics
    public enum SettingsAnalyticEvent: AnalyticTrackingProtocol {

        case textAssistance(isOn: Bool)
        case voiceAssistance(isOn: Bool)
        case voiceType(voiceType: String)
        case testType(testType: String)
        case feedbackTapped
        case feedbackSendButtonTapped
        
        public var eventName: String {
            switch self {
            case .textAssistance:
                return "Pronunciation_Text_Assistance_Changed"
            case .voiceAssistance:
                return "Pronunciation_Voice_Assistance_Changed"
            case .voiceType:
                return "Pronunciation_Voice_Type_Changed"
            case .testType:
                return "Test_Type_Changed"
            case .feedbackTapped:
                return "feedback_button_tapped"
            case .feedbackSendButtonTapped:
                return "feedback_send_button_tapped"
            }
        }
        
        public var parameters: [String : String] {
            switch self {
            case
                    .textAssistance(isOn: let isOn),
                    .voiceAssistance(isOn: let isOn):
                return ["isOn": isOn.description]
            case .voiceType(voiceType: let voiceType):
                return ["voiceType": voiceType]
            case .testType(testType: let testType):
                return ["testType": testType]
            case .feedbackTapped, .feedbackSendButtonTapped:
                return [:]
            }
        }
        
    }
    
    // MARK: - Test Analytics
    public enum TestAnalyticEvent: AnalyticTrackingProtocol {

        case beganTest(testSetting: String)
        case finishedTest(testSetting: String)
        
        public var eventName: String {
            switch self {
            case .beganTest:
                return "Test_Began"
            case .finishedTest:
                return "Test_Finished"
            }
        }
        
        public var parameters: [String : String] {
            switch self {
            case
                    .beganTest(testSetting: let testSetting),
                    .finishedTest(testSetting: let testSetting):
                return ["testSetting": testSetting.appending("s")]
            }
        }
    }
    
    // MARK: - Onboarding Analytics
    public enum OnboardingAnalyticEvent: AnalyticTrackingProtocol {
        case onboardingStarted
        case onboardingFinished
        case viewedSlide(
            slideIndex: Int
        )
        
        public var eventName: String {
            switch self {
            case .onboardingStarted:
                return "Onboarding_Started"
            case .onboardingFinished:
                return "Onboarding_Finished"
            case .viewedSlide:
                return "Viewed_Onboarding_Slide"
            }
        }
        
        public var parameters: [String : String] {
            switch self {
            case .onboardingStarted, .onboardingFinished:
                return [:]
            case .viewedSlide(slideIndex: let slideIndex):
                return [
                    "slideIndex": slideIndex.description
                ]
            }
        }
    }
}
