//
//  MainView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/20/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView {
            router.contentPreview()
                .tabItem {
                    Label("BPMF", systemImage: "keyboard")
                }
            
            router.flashcardView()
                .tabItem {
                    Label("Characters", systemImage: "book.closed")
                }
            
            router.settingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }

            if EnvironmentKeys.environment == .STAGING {
                router.developerControlsView()
                    .tabItem {
                        Label("Dev", systemImage: "ant")
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(dev.router)
    }
}
