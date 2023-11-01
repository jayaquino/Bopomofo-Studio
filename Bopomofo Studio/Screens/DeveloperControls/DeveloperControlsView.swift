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
            
            Toggle(isOn: $viewModel.timerOverride) {
                Text("OVERRIDE_TIMER_TITLE")
            }
            
            Toggle(isOn: $viewModel.soundTipOverride) {
                Text("OVERRIDE_SOUND_TIP_TITLE")
            }
            
            VStack {
                ForEach(viewModel.messages, id: \.self) { message in
                    Text(message.content)
                }
            }
            
            Spacer()
            
            TextField("", text: $viewModel.input)
        }
        .padding()
    }
}

struct DeveloperControlsView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperControlsView(viewModel: DeveloperControlsViewModel(contentStore: dev.contentStore, aiStore: dev.aiStore))
            .environmentObject(dev.router)
    }
}
