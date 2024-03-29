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
                    if let heroContent = viewModel.heroContent {
                        ForEach(heroContent, id: \.self) { category in
                            VStack(alignment: .leading) {
                                Text(category.categoryName)
                                    .font(.largeTitle)
                                    .padding(.horizontal)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 0) {
                                        ForEach(category.topicList, id: \.self) { topic in
                                            NavigationLink {
                                                router.contentPreview(topic: topic)
                                            } label: {
                                                router.heroCellView(topic: topic)
                                            }
                                            .padding()
                                            .simultaneousGesture(TapGesture().onEnded({
                                                viewModel.trackEvent(event: .topicTapped(topic: topic))
                                            }))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if let homeCategoryContent = viewModel.homeCategoryContent {
                        ForEach(homeCategoryContent, id: \.self) { category in
                            VStack(alignment: .leading) {
                                Text(category.categoryName)
                                    .font(.title)
                                    .padding(.horizontal)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 0) {
                                        ForEach(category.topicList, id: \.self) { topic in
                                            NavigationLink {
                                                router.contentPreview(topic: topic)
                                            } label: {
                                                router.homeCategoryView(topic: topic)
                                            }
                                            .padding()
                                            .simultaneousGesture(TapGesture().onEnded({
                                                viewModel.trackEvent(event: .topicTapped(topic: topic))
                                            }))
                                        }
                                    }
                                }
                            }
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
                .padding(.vertical, 10)
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
