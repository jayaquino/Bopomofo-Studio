//
//  HomeViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import Foundation
import CoreBopomofoStudio

@MainActor
class HomeViewModel: ObservableObject {
    let contentStore: ContentStore
    let analytics: AnalyticsProvider
    
    @Published var allCategories: [CategoryModel]?
    @Published var feedback = ""
    @Published var showAlert = false
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider
    ) {
        self.contentStore = contentStore
        self.analytics = analytics

        self.assignVariables()
        self.fetchZhuyinContent()
    }
    
    private func assignVariables() {
        contentStore.$allContent
            .assign(to: &self.$allCategories)
    }
    
    private func fetchZhuyinContent() {
        Task {
            do {
                try await self.contentStore.fetchZhuyinContent()
            } catch {
                print("Error fetching all content")
            }
        }
    }
    
    func sendFeedback() {
        guard !feedback.isEmpty else { return }
        Task {
            trackEvent(event: .feedbackSendButtonTapped)
            let success = try await contentStore.sendFeedback(description: feedback)
            if success {
                feedback = ""
                showAlert = true
            }
        }
    }
    
    func trackEvent(event: AnalyticsProvider.HomeAnalyticEvent) {
        self.analytics.track(event: .home(event: event))
    }
}
