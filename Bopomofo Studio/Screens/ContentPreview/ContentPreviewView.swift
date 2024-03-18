//
//  ContentPreviewZhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/25/22.
//

import SwiftUI
import CoreBopomofoStudio
import MockProvider

struct ContentPreviewView: View {
    @EnvironmentObject var router: Router
    @Environment(\.modelContext) private var context
    @StateObject var viewModel: ContentPreviewViewModel
    @State private var shouldShowAICommunicationView = false
    
    var body: some View {
        ZStack {
            if let selectedVocabulary = viewModel.selectedVocabulary {
                NavigationLink(isActive: $shouldShowAICommunicationView) {
                    router.aiCommunicationView(vocabulary: selectedVocabulary, topic: viewModel.topic)
                } label: {
                    EmptyView()
                }
            }
            
            VStack(spacing: 0) {
                VStack(spacing: 8) {
                    if !UserDefaults.didPlayASoundAtLeastOnce {
                        Text("Tap the cells play sound!")
                            .bold()
                            .multilineTextAlignment(.center)
                    }
                    
                    if !UserDefaults.didNavigateToAICommunicationViewAtLeastOnce, !["Zhuyin Basics", "Pinyin To Zhuyin"].contains(viewModel.topic.topicName) {
                        Text("Tap and hold the cells to see example sentences!")
                            .bold()
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(16)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ForEach(viewModel.topic.vocabulary, id: \.self) { vocabulary in
                            HStack {
                                TestContentCell(
                                    showPronunciation: $viewModel.pronunciationTextMode,
                                    showTranslation: $viewModel.translationMode,
                                    image: vocabulary.characterSet[viewModel.characterSet.rawValue] ?? "",
                                    zhuyin: vocabulary.pronunciationSet["zhuyin"] ?? "",
                                    pinyin: vocabulary.pronunciationSet["pinyin"] ?? "",
                                    translation: vocabulary.translation
                                )
                                .onTapGesture {
                                    viewModel.playSound(symbol: vocabulary.characterSet[viewModel.contentStore.characterSetSetting.rawValue] ?? "")
                                    
                                    viewModel.trackEvent(event: .playSound(
                                        topicName: viewModel.topic.topicName,
                                        character: vocabulary.characterSet[viewModel.contentStore.characterSetSetting.rawValue] ?? "")
                                    )
                                }
                                .onLongPressGesture {
                                    guard !["Zhuyin Basics", "Pinyin To Zhuyin"].contains(viewModel.topic.topicName) else { return }
                                    Task {
                                        viewModel.selectedVocabulary = vocabulary
                                        try? await Task.sleep(nanoseconds: 100_000_000)
                                        self.shouldShowAICommunicationView = true
                                    }
                                }
                                .overlay(
                                    Button(action: {
                                        addVocabularyToSwiftData(vocabulary)
                                    }, label: {
                                        Text("Add")
                                    }), alignment: .topTrailing
                                )
                            }
                        }
                    }
                }
                .foregroundColor(.accentColor)
                
                Divider()
                
                NavigationLink {
                    router.zhuyinTestView(topic: viewModel.topic)
                } label: {
                    Text("Start")
                        .font(.title)
                        .padding(.horizontal)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .disabled(viewModel.topic.vocabulary.count <= 1)
                .padding()
            }
        }
        .navigationTitle("Content Preview")
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
    
    private func addVocabularyToSwiftData(_ vocabulary: VocabularyModel) {
        context.insert(vocabulary)
    }
    
    private func testContent(content: [String]) -> some View {
        VStack(alignment: .trailing){
            ForEach(content, id: \.self){symbol in
                Text(symbol)
                    .padding(2)
                    .font(.custom("chalkboard se", size: 18))
                    .font(.system(size: 18, weight: .thin))
                    .frame(minHeight:100)
                    .multilineTextAlignment(.center)
                    .cornerRadius(30)
            }
        }.padding()
    }
}

struct ContentPreviewZhuyin_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentPreviewView(
            viewModel: ContentPreviewViewModel(contentStore: ContentStore(provider: MockContentProvider()), analytics: dev.analytics, topic: TopicModel(
                topicName: "", topicImage: "", vocabulary: [])))
        .environmentObject(dev.router)
    }
}
