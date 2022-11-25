//
//  OnboardingView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        ForEach(viewModel.onboardingSlides) { slide in
            Text("Hello, World!")
        }
    }
    
    private func onboardingCarouselView(onboardingSlide: OnboardingSlide) -> some View {
        VStack(spacing: 10) {
            Image(onboardingSlide.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(onboardingSlide.title)
                
                Text(onboardingSlide.description)
            }
            .padding(.horizontal, 16)
            .minimumScaleFactor(0.5)
        }
        .padding(.bottom, 65)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
            .environmentObject(dev.router)
    }
}
