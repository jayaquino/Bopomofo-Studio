//
//  PreviewProvider+Extensions.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation

import Foundation
import SwiftUI
import CoreBopomofoStudio
import MockProvider
import MixpanelProvider

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

@MainActor
struct DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let router: Router
    let contentStore: ContentStore
    let aiStore: AIStore
    let analytics: MixpanelProvider
    
    private init() {
        self.contentStore = ContentStore(provider: MockContentProvider())
        self.aiStore = AIStore(provider: MockAIProvider())
        self.analytics = MixpanelProvider(
            key: "",
            environment: .STAGING
        )
        self.router = Router(
            contentStore: self.contentStore,
            aiStore: self.aiStore,
            analytics: self.analytics
        )
    }
}
