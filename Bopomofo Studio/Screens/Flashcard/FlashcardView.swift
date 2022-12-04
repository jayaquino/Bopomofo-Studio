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
            if let characterSet = viewModel.characterSet {
                ForEach(characterSet, id: \.id) { vocabulary in
                    Text(vocabulary.character)
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
