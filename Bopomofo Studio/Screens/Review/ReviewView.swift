//
//  ReviewView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 3/17/24.
//

import SwiftUI
import CoreBopomofoStudio
import SwiftData

struct ReviewView: View {
    @Environment(\.modelContext) private var context
    @Query private var vocabulary: [VocabularyModel]
    
    @StateObject var viewModel: ReviewViewModel
    
    var body: some View {
        List {
            ForEach (vocabulary) { vocabulary in
                Text(vocabulary.translation)
            }
        }
    }
}

#Preview {
    ReviewView(viewModel: ReviewViewModel())
}
