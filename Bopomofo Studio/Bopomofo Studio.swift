//
//  Bopomofo_StudioApp.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI
import CoreBopomofoStudio
import FirebaseProvider
import Firebase
import MixpanelProvider

@main
struct Bopomofo_StudioApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let router: Router
    let analytics: any AnalyticsProvider
    
    init() {
        FirebaseApp.configure()
        
        let contentStore = ContentStore(
            provider: FirebaseContentProvider(provider: FirebaseProvider())
        )
        
        self.router = Router(contentStore: contentStore)
        self.analytics = MixpanelProvider()
    }
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.router)
        }
    }
}
