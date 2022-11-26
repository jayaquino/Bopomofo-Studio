//
//  OnboardingViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import Foundation
import OneSignal

class OnboardingViewModel: ObservableObject {
    var onboardingSlides: [OnboardingSlide] = [
        OnboardingSlide(
            image: "onboarding_Slide_One",
            title: "ONBOARDING_SLIDE_ONE_TITLE",
            description: "ONBOARDING_SLIDE_ONE_DESCRIPTION"
        ),
        OnboardingSlide(
            image: "onboarding_Slide_Two",
            title: "ONBOARDING_SLIDE_TWO_TITLE",
            description: "ONBOARDING_SLIDE_THREE_DESCRIPTION"
        ),
        OnboardingSlide(
            image: "onboarding_Slide_Three",
            title: "ONBOARDING_SLIDE_THREE_TITLE",
            description: "ONBOARDING_SLIDE_THREE_DESCRIPTION"
        ),
        OnboardingSlide(
            image: "onboarding_Notification",
            title: "ONBOARDING_NOTIFICATION_TITLE",
            description: "ONBOARDING_NOTIFICATION_DESCRIPTION"
            )
    ]
    
    @Published var selection: OnboardingSlide
    @Published var showHomeView = false
    
    init() {
        selection = onboardingSlides[0]
    }
    
    func nextButtonPressed() {
        guard let selectionIndex = onboardingSlides.firstIndex(of: selection) else { return }
        let nextIndex = selectionIndex + 1
        
        if nextIndex < onboardingSlides.count {
            selection = onboardingSlides[nextIndex]
        } else {
            OneSignal.promptForPushNotifications(userResponse: { _ in })
            showHomeView = true
        }
    }
    
    func setDidSeeOnboarding() {
        UserDefaults.didSeeOnboarding = true
    }
}
