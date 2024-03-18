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
    @EnvironmentObject var router: Router
    @Environment(\.modelContext) private var context
    @Query private var vocabulary: [VocabularyModel]
    
    @StateObject var viewModel: ReviewViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ForEach (vocabulary) { vocabulary in
                            TestContentCell(
                                vocabularyModel: vocabulary,
                                showPronunciation: $viewModel.pronunciationTextMode,
                                showTranslation: $viewModel.translationMode,
                                image: vocabulary.characterSet[viewModel.characterSet.rawValue] ?? "",
                                zhuyin: vocabulary.pronunciationSet["zhuyin"] ?? "",
                                pinyin: vocabulary.pronunciationSet["pinyin"] ?? "",
                                translation: vocabulary.translation
                            )
                        }
                    }
                }
                
                Divider()
                
                NavigationLink {
                    router.zhuyinTestView(topic: .init(topicName: "Review", topicImage: "", vocabulary: vocabulary))
                } label: {
                    Text("Start")
                        .font(.title)
                        .padding(.horizontal)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .disabled(vocabulary.count <= 1)
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    router.settingsView()
                } label: {
                    Image(systemName: "gear")
                    
                }
            }
        }
    }
}
struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(viewModel: ReviewViewModel(contentStore: dev.contentStore))
        .environmentObject(dev.router)
    }
}
