//
//  FeaturedContentCellView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/5/22.
//

import SwiftUI
import CoreBopomofoStudio
import NukeUI

struct HomeCategoryCellView: View {
    @ObservedObject var viewModel: HomeCategoryCellViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0) {
                VStack(spacing: 0) {
                    LazyImage(url: URL(string: viewModel.topic.topicImage), resizingMode: .aspectFit)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                Text(viewModel.topic.topicName)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .padding()
            }
            .frame(width: 200, height: 250, alignment: .top)
            .cornerRadius(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    .shadow(
                        color: .black.opacity(0.25),
                        radius: 7,
                        x: 0,
                        y: 2
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.secondary, lineWidth: 1)
                    )
            )
            
        }
        .onAppear {
            viewModel.loadImage()
        }
    }
}

struct HomeCategoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoryCellView(
            viewModel: HomeCategoryCellViewModel(
                contentStore: dev.contentStore,
                topic: TopicModel(
                    topicName: "",
                    topicImage: "",
                    vocabulary: [])
            )
        )
    }
}
