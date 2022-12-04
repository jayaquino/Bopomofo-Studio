//
//  HomeView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            if let allCategories = viewModel.allCategories {
                ForEach(allCategories, id: \.self) { category in
                    ForEach(category.topicList, id: \.self) { topic in
                        Text(topic.topicName)
                    }
                }
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(contentStore: dev.contentStore))
            .environmentObject(dev.router)
    }
}
