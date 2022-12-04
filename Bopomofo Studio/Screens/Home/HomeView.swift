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
            ScrollView(.vertical, showsIndicators: false) {
            if let zhuyinContent = viewModel.zhuyinContent {
                    ForEach(zhuyinContent, id: \.self) { category in
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
            if let featuredContent = viewModel.featuredContent {
                ForEach(featuredContent, id: \.self) { category in
                    Text(category.categoryName)
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
