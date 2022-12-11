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
    
    @State var showTestView = false
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    ForEach(0..<viewModel.topic.vocabulary.count, id: \.self) { index in
                        TestContentCell(
                            image: viewModel.topic.vocabulary[index].characterSet[viewModel.contentStore.characterSetSetting.rawValue] ?? "",
                            showPronunciation: $viewModel.pronunciationTextMode,
                            zhuyin: viewModel.topic.vocabulary[index].pronunciationSet["zhuyin"] ?? "",
                            pinyin: viewModel.topic.vocabulary[index].pronunciationSet["pinyin"] ?? ""
                        )
                        .onTapGesture {
                            viewModel.playSound(symbol: viewModel.topic.vocabulary[index].characterSet[viewModel.contentStore.characterSetSetting.rawValue] ?? "")
                        }
                    }
                }
            }
            .foregroundColor(.accentColor)
            
            Divider()
            
            Button(action: {
                showTestView = true
            }, label: {
                Text("Start")
                    .font(.title)
                    .padding(.horizontal)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            })
            .padding()
            .disabled(viewModel.topic.vocabulary.count <= 1)
        }
        .fullScreenCover(isPresented: $showTestView) {
            router.zhuyinTestView(topic: viewModel.topic)
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
            viewModel: ContentPreviewViewModel(contentStore: ContentStore(provider: MockContentProvider()), topic: TopicModel(
                topicName: "", topicImage: "", vocabulary: [])))
        .environmentObject(dev.router)
    }
}
