//
//  TopicCellView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import SwiftUI
import FirebaseStorage
import CoreBopomofoStudio

struct TopicCellView: View {
    @ObservedObject var viewModel: TopicCellViewModel
    
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
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .redacted(reason: .placeholder)
                    }
                }
                Text(viewModel.topic.topicName)
                    .font(.headline)
                    .fontWeight(.light)
                    .padding()
            }
            .frame(width: 250, height: 300, alignment: .top)
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

struct TopicCellView_Previews: PreviewProvider {
    static var previews: some View {
        TopicCellView(viewModel: TopicCellViewModel(
            contentStore: dev.contentStore, topic: TopicModel(
                topicName: "BPMF",
                topicImage: "BPMF.png",
                vocabulary: []
            )
        ))
    }
}
