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
    
    @Published var heroContent: [CategoryModel]?
    @Published var homeCategoryContent: [CategoryModel]?
    @Published var feedback = ""
    @Published var showAlert = false
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider
    ) {
        self.contentStore = contentStore
        self.analytics = analytics

        self.assignVariables()
        self.fetchAllContent()
    }
    
    private func assignVariables() {
        contentStore.$heroContent
            .assign(to: &self.$heroContent)
        
        contentStore.$homeCategoryContent
            .assign(to: &self.$homeCategoryContent)
    }
    
    private func fetchAllContent() {
        fetchZhuyinContent()
        fetchHomeCategoryContent()
        
        if EnvironmentKeys.environment == .STAGING {
            fetchTestContent()
        }
    }
    
    private func fetchZhuyinContent() {
        Task {
            do {
                try await self.contentStore.fetchZhuyinContent()
            } catch {
                print("Error fetching Featured content")
            }
        }
    }
    
    private func fetchHomeCategoryContent() {
        Task {
            do {
                try await self.contentStore.fetchHomeCategoryContent()
            } catch {
                print("Error fetching Home content")
            }
        }
    }
    
    private func fetchTestContent() {
        Task {
            do {
                try await self.contentStore.fetchTestContent()
            } catch {
                print("Error fetching Test content")
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
