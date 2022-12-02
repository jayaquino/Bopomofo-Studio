//
//  FlashcardView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/2/22.
//

import SwiftUI

struct FlashcardView: View {
    @StateObject var viewModel: FlashcardViewModel
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(viewModel: FlashcardViewModel(contentStore: dev.contentStore))
    }
}
