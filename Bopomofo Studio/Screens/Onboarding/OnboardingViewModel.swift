//
//  OnboardingViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    var onboardingSlides: [OnboardingSlide] = [
        OnboardingSlide(
            image: "",
            title: "",
            description: ""
        ),
        OnboardingSlide(
            image: "",
            title: "",
            description: ""
        ),
        OnboardingSlide(
            image: "",
            title: "",
            description: ""
        )
    ]
    
    @Published var selection: OnboardingSlide
    
    init() {
        selection = onboardingSlides[0]
    }
    
    func nextButtonPressed() {
        guard let selectionIndex = onboardingSlides.firstIndex(of: selection) else { return }
        let nextIndex = selectionIndex + 1
        
        if nextIndex < onboardingSlides.count {
            selection = onboardingSlides[nextIndex]
        }
    }
}
