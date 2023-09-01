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
    @StateObject var viewModel: ContentPreviewViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
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
                                
                                if !UserDefaults.didPlayASoundAtLeastOnce && vocabulary == viewModel.topic.vocabulary.first {
                                    Image(systemName: "chevron.left")
                                    Text("Tap to play sound!")
                                        .bold()
                                }
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
