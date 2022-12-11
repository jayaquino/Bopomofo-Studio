//
//  FeaturedContentCellViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/5/22.
//

import CoreBopomofoStudio
import UIKit

@MainActor
class HomeCategoryCellViewModel: ObservableObject {
    let contentStore: ContentStore
    let topic: TopicModel
    
    @Published var image: UIImage?
    
    init(
        contentStore: ContentStore,
        topic: TopicModel
    ) {
        self.contentStore = contentStore
        self.topic = topic
    }
    
    func loadImage() {
        Task {
            do {
                self.image = try await self.contentStore.fetchImage(urlString: topic.topicImage)
            } catch {
                print("Error loading image", error)
            }
        }
    }
}
