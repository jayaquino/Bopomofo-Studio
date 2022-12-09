//
//  OnboardingView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import SwiftUI
import OneSignal

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    @EnvironmentObject var router: Router
    @Binding var showOnboarding: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                pagerView
                Spacer()
                
                VStack(spacing: 10) {
                    if viewModel.selection.title == LocalizedStringKey("ONBOARDING_NOTIFICATION_TITLE") {
                        Button("Enable Notifications") {
                            enableNotificationButtonTapped()
                        }
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    }
                    actionButton
                }
                .frame(height: 56)
                
            }
            .padding()
            .onAppear {
                viewModel.setDidSeeOnboarding()
                viewModel.analytics.track(event: .onboarding(event: .onboardingStarted))
            }
            .onDisappear {
                viewModel.analytics.track(event: .onboarding(event: .onboardingFinished))
            }
        }
        .onChange(of: viewModel.showOnboarding) { newValue in
            showOnboarding = newValue
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
    
    private var actionButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            if viewModel.selection.title == LocalizedStringKey("ONBOARDING_NOTIFICATION_TITLE") {
                Text("Not Now")
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
            } else {
                Image(systemName: "arrow.right")
                    .font(.system(size: 30, weight: .light))
                    .foregroundStyle(.white)
                    .frame(width: 86, height: 56)
                    .background(.tint)
                    .clipShape(Circle())
            }
        }
        .buttonStyle(.plain)
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
    
    private func enableNotificationButtonTapped() {
        OneSignal.promptForPushNotifications(userResponse: { _ in
            showOnboarding = false
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel(analytics: dev.analytics), showOnboarding: .constant(false))
            .environmentObject(dev.router)
        
        OnboardingView(viewModel: OnboardingViewModel(analytics: dev.analytics), showOnboarding: .constant(false))
            .environmentObject(dev.router)
            .previewDevice(PreviewDevice(rawValue: "iPad Air (3rd generation)"))
            .previewDisplayName("iPad Air (3rd generation)")
    }
}
