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
    
    init() {
        let filePath = Bundle.main.path(forResource: EnvironmentKeys.googlePlist, ofType: "plist")
        guard let options = FirebaseOptions(contentsOfFile: filePath!)
          else {
            fatalError("Couldn't load config file")
        }
        FirebaseApp.configure(options: options)
        
        let contentStore = ContentStore(
            provider: FirebaseContentProvider(provider: FirebaseProvider())
        )
        
       let analytics = MixpanelProvider(
            key: EnvironmentKeys.mixpanelKey,
            environment: EnvironmentKeys.environment
        )
        
        self.router = Router(
            contentStore: contentStore,
            analytics: analytics
        )
    }
        
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
                    .environmentObject(router)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
