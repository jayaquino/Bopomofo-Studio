//
//  AICommunicationView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 10/31/23.
//

import SwiftUI
import CoreBopomofoStudio

struct AICommunicationView: View {
    @StateObject var viewModel: AICommunicationViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.character)
                .font(.title)
                .padding(16)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.messagesToPresent, id: \.self) { message in
                        HStack(alignment: .center, spacing: 0) {
                            Text(message.content)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.vertical, 16)
                            
                            Image(systemName: "speaker.wave.3")
                                .onTapGesture {
                                    viewModel.extractChineseCharactersAndPlaySound(from: message.content)
                                }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                    }
                    
                    ProgressView()
                        .opacity(viewModel.isFetching ? 1 : 0)
                }
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                ForEach(AICommunicationViewModel.CommunicationRequest.allCases) { request in
                    if (viewModel.messagesToPresent.isEmpty && request == .example) || (!viewModel.messagesToPresent.isEmpty && request != .example) {
                        Button {
                            viewModel.requestButtonTapped(input: request)
                        } label: {
                            Text(request.title)
                        }
                    }
                }
            }
            .opacity(viewModel.isFetching ? 0 : 1)
        }
    }
}

struct AICommunicationView_Previews: PreviewProvider {
    static var previews: some View {
        AICommunicationView(viewModel: AICommunicationViewModel(vocabulary: VocabularyModel(characterSet: [:], pronunciationSet: [:], translation: ""), topic: TopicModel(topicName: "", topicImage: "", vocabulary: []), aiStore: dev.aiStore, contentStore: dev.contentStore))
    }
}
