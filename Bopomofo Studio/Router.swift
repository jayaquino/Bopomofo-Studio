//
//  Router.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 9/5/22.
//

import Foundation
import CoreBopomofoStudio
import MockProvider

@MainActor
class Router: ObservableObject {
    
    private let contentStore: ContentStore
    private let analytics: AnalyticsProvider
    
    init(
        contentStore: ContentStore,
        analytics: AnalyticsProvider
    ) {
        self.contentStore = contentStore
        self.analytics = analytics
    }
    
    func homeView() -> HomeView {
        HomeView(viewModel: HomeViewModel(contentStore: self.contentStore))
    }
    
    func zhuyinTestView(
        symbolList: [String],
        symbolPronunciation: [String]
    ) -> ZhuyinTestView {
        ZhuyinTestView(
            viewModel: ZhuyinViewModel(
                contentStore: self.contentStore,
                analytics: self.analytics,
                symbolList: symbolList,
                symbolPronunciation: symbolPronunciation
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
            viewModel: DeveloperControlsViewModel(contentStore: self.contentStore)
        )
    }
    
    func contentPreview(topic: TopicModel) -> ContentPreviewView {
        ContentPreviewView(
            viewModel: ContentPreviewViewModel(
                contentStore: self.contentStore,
                topic: topic
            )
        )
    }
    
    func flashcardView() -> FlashcardView {
        FlashcardView(viewModel: FlashcardViewModel(contentStore: self.contentStore))
    }
    
    func topicCellView(topic: TopicModel) -> TopicCellView {
        TopicCellView(viewModel: TopicCellViewModel(
            contentStore: self.contentStore,
            topic: topic)
        )
    }
}
