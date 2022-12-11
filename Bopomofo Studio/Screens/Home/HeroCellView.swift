//
//  TopicCellView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import SwiftUI
import FirebaseStorage
import CoreBopomofoStudio
import NukeUI

struct HeroCellView: View {
    @ObservedObject var viewModel: HeroCellViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0) {
                LazyImage(url: URL(string: viewModel.topic.topicImage)!, resizingMode: .aspectFit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
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

struct HeroCellView_Previews: PreviewProvider {
    static var previews: some View {
        HeroCellView(viewModel: HeroCellViewModel(
            contentStore: dev.contentStore, topic: TopicModel(
                topicName: "BPMF",
                topicImage: "BPMF.png",
                vocabulary: []
            )
        ))
    }
}
