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
        ZStack {
            VStack(spacing: 30) {
                NavigationLink(isActive: $viewModel.showHomeView) {
                    MainView()
                } label: {
                    EmptyView()
                }
                
                pagerView
                Spacer()
                Button {
                    viewModel.nextButtonPressed()
                } label: {
                    if viewModel.selection.title == LocalizedStringKey("ONBOARDING_NOTIFICATION_TITLE") {
                        Image(systemName: "checkmark")
                    } else {
                        Image(systemName: "arrow.right")
                    }
                }
                .font(.system(size: 30, weight: .light))
                .foregroundStyle(.white)
                .frame(width: 86, height: 56)
                .background(.tint)
                .clipShape(Circle())
            }
            .onAppear {
                viewModel.setDidSeeOnboarding()
            }
        }
    }
    
    private var pagerView: some View {
        TabView(selection: $viewModel.selection) {
            ForEach(viewModel.onboardingSlides) { slide in
                onboardingCarouselView(onboardingSlide: slide)
                    .frame(maxWidth: 400, maxHeight: 500)
                    .tag(slide)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .animation(.linear, value: viewModel.selection)
    }
    
    private func onboardingCarouselView(onboardingSlide: OnboardingSlide) -> some View {
        VStack(spacing: 10) {
            Image(onboardingSlide.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(onboardingSlide.title)
                    .font(.title)
                
                Text(onboardingSlide.description)
                    .font(.callout)
            }
            .padding(.horizontal, 16)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
            .environmentObject(dev.router)
        
        OnboardingView(viewModel: OnboardingViewModel())
            .environmentObject(dev.router)
            .previewDevice(PreviewDevice(rawValue: "iPad Air (3rd generation)"))
            .previewDisplayName("iPad Air (3rd generation)")
    }
}
