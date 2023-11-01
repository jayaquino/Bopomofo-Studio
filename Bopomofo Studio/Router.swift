//
//  Router.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import CoreBopomofoStudio
import MockProvider
import SwiftUI

@MainActor
class Router: ObservableObject {
    
    private let contentStore: ContentStore
    private let aiStore: AIStore
    private let analytics: AnalyticsProvider
    
    init(
        contentStore: ContentStore,
        aiStore: AIStore,
        analytics: AnalyticsProvider
    ) {
        self.contentStore = contentStore
        self.aiStore = aiStore
        self.analytics = analytics
    }
    
    func homeView() -> HomeView {
        HomeView(viewModel: HomeViewModel(
            contentStore: self.contentStore,
            analytics: self.analytics)
        )
    }
    
    func statisticsView() -> StatisticsView {
        StatisticsView(viewModel: StatisticsViewModel(contentStore: self.contentStore))
    }
    
    func onboardingView(showOnboarding: Binding<Bool>) -> OnboardingView {
        OnboardingView(viewModel: OnboardingViewModel(analytics: self.analytics), showOnboarding: showOnboarding)
    }
    
    func zhuyinTestView(
        topic: TopicModel
    ) -> ZhuyinTestView {
        ZhuyinTestView(
            viewModel: ZhuyinViewModel(
                topic: topic,
                contentStore: self.contentStore,
                analytics: self.analytics
            )
        )
    }
    
    func settingsView() -> SettingsView {
        SettingsView(
            viewModel: SettingsViewModel(
                contentStore: self.contentStore,
                analytics: self.analytics
            )
        )
    }
    
    func developerControlsView() -> DeveloperControlsView {
        DeveloperControlsView(
            viewModel: DeveloperControlsViewModel(contentStore: self.contentStore, aiStore: self.aiStore)
        )
    }
    
    func contentPreview(topic: TopicModel) -> ContentPreviewView {
        ContentPreviewView(
            viewModel: ContentPreviewViewModel(
                contentStore: self.contentStore,
                analytics: self.analytics,
                topic: topic
            )
        )
    }
    
    func flashcardView() -> FlashcardView {
        FlashcardView(viewModel: FlashcardViewModel(contentStore: self.contentStore))
    }
    
    func heroCellView(topic: TopicModel) -> HeroCellView {
        HeroCellView(viewModel: HeroCellViewModel(
            contentStore: self.contentStore,
            topic: topic)
        )
    }
    
    func homeCategoryView(topic: TopicModel) -> HomeCategoryCellView {
        HomeCategoryCellView(viewModel: HomeCategoryCellViewModel(
            contentStore: self.contentStore,
            topic: topic)
        )
    }
    
    func aiCommunicationView(vocabulary: VocabularyModel, topic: TopicModel) -> AICommunicationView {
        AICommunicationView(viewModel: AICommunicationViewModel(vocabulary: vocabulary, topic: topic, aiStore: self.aiStore, contentStore: self.contentStore))
    }
}
