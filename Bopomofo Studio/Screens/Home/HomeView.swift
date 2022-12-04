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
    @State var showFeedbackSheet = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if let allCategories = viewModel.allCategories {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(allCategories, id: \.self) { category in
                        VStack(alignment: .leading) {
                            Text(category.categoryName)
                                .font(.largeTitle)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(category.topicList, id: \.self) { topic in
                                        NavigationLink {
                                            router.contentPreview(topic: topic)
                                        } label: {
                                            router.topicCellView(topic: topic)
                                        }
                                        .padding()
                                    }
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
            Spacer()
            Button {
                showFeedbackSheet = true
                viewModel.trackEvent(event: .feedbackTapped)
            } label: {
                Text("SEND_FEEDBACK_BUTTON")
                    .font(.footnote)
            }
            .padding(.vertical, 20)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showFeedbackSheet) {
            FeedbackSheet(viewModel: viewModel)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(
            contentStore: dev.contentStore,
            analytics: dev.analytics)
        )
        .environmentObject(dev.router)
    }
}
