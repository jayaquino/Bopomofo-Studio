//
//  FeaturedContentCellView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/5/22.
//

import SwiftUI
import CoreBopomofoStudio

struct FeaturedContentCellView: View {
    @ObservedObject var viewModel: FeaturedContentViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0) {
                VStack(spacing: 0) {
                    if let image = viewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        Image("comingSoon")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
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

struct FeaturedContentCellView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedContentCellView(
            viewModel: FeaturedContentViewModel(
                contentStore: dev.contentStore,
                topic: TopicModel(
                    topicName: "",
                    topicImage: "",
                    vocabulary: [])
            )
        )
    }
}
