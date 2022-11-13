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
    
    private init() {
        self.contentStore = ContentStore(provider: MockContentProvider())
        self.router = Router(
            contentStore: self.contentStore
        )
    }
}