//
//  HomeViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/4/22.
//

import Foundation
import CoreBopomofoStudio

@MainActor
class HomeViewModel: ObservableObject {
    let contentStore: ContentStore
    
    @Published var allCategories: [CategoryModel]?
    
    init(contentStore: ContentStore) {
        self.contentStore = contentStore

        self.assignVariables()
        self.fetchAllCategories()
    }
    
    private func assignVariables() {
        contentStore.$allContent
            .assign(to: &self.$allCategories)
    }
    
    private func fetchAllCategories() {
        Task {
            do {
                try await self.contentStore.fetchAllCategories()
            } catch {
                print("Error fetching all content")
            }
        }
    }
}
