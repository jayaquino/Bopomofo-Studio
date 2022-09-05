//
//  ContentView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image("BPMF")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.screenWidth/2)
                    .padding()
                
                NavigationLink(destination: SettingsView()) {
                    Text("START_BUTTON")
                        .font(.largeTitle)
                }
            }
            .font(.custom("copperplate", size: 20))
            .frame(maxWidth: Constants.screenWidth)
            .padding()
        }
    }
}

struct SelectionNavigation: View {
    let title : String
    var body: some View {
        Text(title)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.system(size: 30, weight: .medium))
            .padding()
            .background(Color.accentColor)
            .cornerRadius(30)
            .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingsViewModel())
    }
}
