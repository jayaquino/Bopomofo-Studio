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
    let analytics: AnalyticsProvider
    
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
        
        setUpStore()
        
        let analytics = MixpanelProvider(
            key: EnvironmentKeys.mixpanelKey,
            environment: EnvironmentKeys.environment
        )
        
        self.analytics = analytics
        
        self.router = Router(
            contentStore: contentStore,
            analytics: analytics
        )
        
        func setUpStore() {
            contentStore.characterSetSetting = .init(rawValue: UserDefaults.characterSet) ?? .simplified
            contentStore.voiceSelection = .init(rawValue: UserDefaults.voiceSelection) ?? .female
            contentStore.pronunciationTextMode = UserDefaults.pronunciationTextMode
            contentStore.pronunciationVoiceMode = UserDefaults.pronunciationVoiceMode
            contentStore.translationMode = UserDefaults.translationMode
            contentStore.speakingSpeed = UserDefaults.speakingSpeed == 0.0 ? 50.0 : UserDefaults.speakingSpeed
            contentStore.timerValue = UserDefaults.timerValue == 0.0 ? 30.0 : UserDefaults.timerValue
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(router)
                .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}
