//
//  AnalyticsProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation

public protocol AnalyticTrackingProtocol {
    var eventName: String { get }
    var parameters: [String: Any] { get }
}

open class AnalyticsProvider {
    
    public init() {}
    
    // Override track
    open func track(event: AnalyticEvent) { }
    
    public enum AnalyticEvent: AnalyticTrackingProtocol {
        
        case onboarding(event: OnboardingAnalyticEvent)
        case settings(event: SettingsAnalyticEvent)
        case test(event: TestAnalyticEvent)
        case home(event: HomeAnalyticEvent)
        case contentPreview(event: ContentPreviewAnalyticEvent)
        
        public var eventName: String {
            switch self {
            case
                    .home(event: let event as AnalyticTrackingProtocol),
                    .onboarding(event: let event as AnalyticTrackingProtocol),
                    .settings(event: let event as AnalyticTrackingProtocol),
                    .test(event: let event as AnalyticTrackingProtocol),
                    .contentPreview(event: let event as AnalyticTrackingProtocol)
                :
                
                return event.eventName
            }
        }
        
        public var parameters: [String: Any] {
            switch self {
            case
                    .home(event: let event as AnalyticTrackingProtocol),
                    .onboarding(event: let event as AnalyticTrackingProtocol),
                    .settings(event: let event as AnalyticTrackingProtocol),
                    .test(event: let event as AnalyticTrackingProtocol),
                    .contentPreview(event: let event as AnalyticTrackingProtocol)
                :
                
                return event.parameters
            }
        }
    }
    
    // MARK: - Home Analytics
    public enum HomeAnalyticEvent: AnalyticTrackingProtocol {
        case feedbackTapped
        case feedbackSendButtonTapped
        case topicTapped(topic: TopicModel)
        
        public var eventName: String {
            switch self {
            case .feedbackTapped:
                return "feedback_button_tapped"
            case .feedbackSendButtonTapped:
                return "feedback_send_button_tapped"
            case .topicTapped:
                return "topic_tapped"
            }
        }
        
        public var parameters: [String : Any] {
            switch self {
            case .feedbackTapped, .feedbackSendButtonTapped:
                return [:]
            case .topicTapped(topic: let topic):
                return ["topic_name": topic.topicName]
            }
        }
    }
    
    // MARK: - Settings Analytics
    public enum SettingsAnalyticEvent: AnalyticTrackingProtocol {

        case textAssistance(isOn: Bool)
        case voiceAssistance(isOn: Bool)
        case voiceType(voiceType: String)
        case timerChanged(timer: Double)
        case utterSpeedChanged(speed: Float)
        case characterSet(characterSet: String)
        case translationMode(isOn: Bool)
        
        public var eventName: String {
            switch self {
            case .textAssistance:
                return "Pronunciation_Text_Assistance_Changed"
            case .voiceAssistance:
                return "Pronunciation_Voice_Assistance_Changed"
            case .voiceType:
                return "Pronunciation_Voice_Type_Changed"
            case .timerChanged:
                return "timer_changed"
            case .utterSpeedChanged:
                return "utter_speed_changed"
            case .characterSet:
                return "character_set_changed"
            case .translationMode:
                return "translation_mode_changed"
            }
        }
        
        public var parameters: [String : Any] {
            switch self {
            case
                    .textAssistance(isOn: let isOn),
                    .voiceAssistance(isOn: let isOn),
                    .translationMode(isOn: let isOn):
                return ["isOn": isOn]
            case .voiceType(voiceType: let voiceType):
                return ["voiceType": voiceType]
            case .timerChanged(timer: let timer):
                return ["timer_value": timer]
            case .utterSpeedChanged(speed: let speed):
                return ["speed_value": speed]
            case .characterSet(characterSet: let characterSet):
                return ["character_set": characterSet]
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
        
        public var parameters: [String : Any] {
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
        case notificationsNotNowTapped
        case notificationEnabled(enabled: Bool)
        
        public var eventName: String {
            switch self {
            case .onboardingStarted:
                return "Onboarding_Started"
            case .onboardingFinished:
                return "Onboarding_Finished"
            case .viewedSlide:
                return "Viewed_Onboarding_Slide"
            case .notificationsNotNowTapped:
                return "onboarding_notification_not_now_tapped"
            case .notificationEnabled:
                return "onboarding_notification_enabled"
            }
        }
        
        public var parameters: [String : Any] {
            switch self {
            case .onboardingStarted, .onboardingFinished, .notificationsNotNowTapped:
                return [:]
            case .viewedSlide(slideIndex: let slideIndex):
                return [
                    "slideIndex": slideIndex
                ]
            case .notificationEnabled(enabled: let enabled):
                return ["enabled": enabled]
            }
        }
    }
    
    // MARK: - ContentPreview Analytics
    public enum ContentPreviewAnalyticEvent: AnalyticTrackingProtocol {
        case playSound(
            topicName: String,
            character: String
        )
        
        public var eventName: String {
            switch self {
            case .playSound:
                return "sound_played"
            }
        }
        
        public var parameters: [String : Any] {
            switch self {
            case .playSound(let topicName, let character):
                return [
                    "topic_name": topicName,
                    "character": character
                ]
            }
        }
    }
}
