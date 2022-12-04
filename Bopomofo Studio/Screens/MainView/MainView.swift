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
            NavigationView {
                router.homeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
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
