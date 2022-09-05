//
//  Bopomofo_StudioApp.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI

@main
struct Bopomofo_StudioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SettingsViewModel())
        }
    }
}
