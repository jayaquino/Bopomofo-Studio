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
    
    func zhuyinTestView() -> ZhuyinTestView {
        ZhuyinTestView(
            viewModel: ZhuyinViewModel(contentStore: self.contentStore)
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
    
    func contentPreview() -> ContentPreviewView {
        ContentPreviewView(
            viewModel: ContentPreviewViewModel(contentStore: self.contentStore)
        )
    }
}
