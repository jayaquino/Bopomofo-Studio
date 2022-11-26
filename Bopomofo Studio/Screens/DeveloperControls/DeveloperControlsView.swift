//
//  DeveloperControlsView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/26/22.
//

import SwiftUI

struct DeveloperControlsView: View {
    @StateObject var viewModel: DeveloperControlsViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Toggle(isOn: $viewModel.didSeeOnboarding) {
                Text("DID_SEE_ONBOARDING_TITLE")
            }
            .disabled(!UserDefaults.didSeeOnboarding)
        }
        .padding()
    }
}

struct DeveloperControlsView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperControlsView(viewModel: DeveloperControlsViewModel())
            .environmentObject(dev.router)
    }
}
