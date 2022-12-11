//
//  Zhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI
import Darwin
import CoreBopomofoStudio
import MockProvider

struct ZhuyinTestView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel : ZhuyinViewModel
    
    @FocusState private var focus: Bool
    
    // Timer
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            VStack(spacing: 5) {
                Text("High Score: " + String(UserDefaults.standard.integer(forKey: viewModel.topic.topicName)))
                
                Text("Score: " + String(viewModel.score))
            }
            .frame(maxWidth: 600, maxHeight: 50)
            .font(.subheadline)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .clipShape(Capsule())
            .padding()
            
            if LanguageHelper.isZhuyinOrPinyin(viewModel.randomCharacter) {
                Image(viewModel.randomCharacter)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 150)
                    .padding()
            } else {
                Text(viewModel.randomCharacter)
                    .font(.system(size: 125, weight: .bold))
                    .padding(5)
            }
            if viewModel.contentStore.translationMode && viewModel.randomCharacterTranslation != " " {
                Text(viewModel.randomCharacterTranslation)
            }
            
            if viewModel.contentStore.pronunciationTextMode {
                HStack {
                    Text(viewModel.randomCharacterPinyin)
                        .frame(height: 30)
                    if viewModel.markIncorrect {
                        Text(viewModel.randomCharacterZhuyin)
                            .frame(height: 30)
                            .opacity(0.5)
                    } else {
                        Text(" ")
                            .frame(height: 30)
                    }
                }
            }
            
            HStack {
                if viewModel.timer >= 1 {
                    Text("Time Remaining: \(String(format: "%.0f", viewModel.timer)) s").onReceive(timer) { _ in
                        if viewModel.timer > 0 {
                            viewModel.timer -= 1
                        }
                    }
                    
                    if !viewModel.isZhuyinOrPinyin {
                        Button {
                            viewModel.skipButtonPressed()
                        } label: {
                            Text("Skip")
                                .font(.subheadline)
                                .padding()
                                .background(Color.accentColor)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .disabled(viewModel.markIncorrect)
                        }
                        .buttonStyle(.plain)
                        
                    }
                    
                } else {
                    Text("Test Finished")
                        .fontWeight(.bold)
                }
            }
            .font(.subheadline)
            
            TextField("Enter the character shown", text: $viewModel.inputSymbol)
                .focused($focus)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onAppear {
                    focus.toggle()
                }
        }
        .padding(.top, 30)
        .foregroundColor(.accentColor)
        .navigationBarHidden(true)
        .onAppear {
            viewModel.trackEvent(event: .beganTest(testSetting: viewModel.contentStore.timerValue.description))
        }
        .fullScreenCover(isPresented: $viewModel.showResults) {
            resultsView
                .onAppear {
                    viewModel.trackEvent(event: .finishedTest(testSetting: viewModel.contentStore.timerValue.description))
                }
        }
    }
    
    private var resultsView: some View {
        ZStack {
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack (spacing: 10) {
                    Text("High Score: \(UserDefaults.standard.integer(forKey: viewModel.topic.topicName))")
                        .font(.headline)
                    
                    Text("Time Setting : \(String(format: "%.0f",viewModel.contentStore.timerValue)) seconds")
                        .font(.subheadline)
                    Text(viewModel.score > 0 ? "Score: \(viewModel.score)" : "Try Again!")
                        .font(.subheadline)
                    if let scorePercentage = viewModel.scorePercentage {
                        Text("Your score beats or equals \(scorePercentage , specifier: "%.1f")% of people who took this test!")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    } else if viewModel.score != 0 {
                        ProgressView()
                            .tint(.white)
                    }
                    Text("Incorrect Vocabulary")
                        .font(.headline)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 200, height: 2)
                    
                    if viewModel.incorrectVocabulary.isEmpty && viewModel.score > 0 {
                        Image(systemName: "checkmark.circle")
                            .renderingMode(.template)
                            .frame(maxWidth: 300, maxHeight: 300)
                            .foregroundColor(.green)
                    } else {
                        ForEach(viewModel.incorrectVocabulary, id: \.id) { incorrectVocabulary in
                            HStack {
                                Text(incorrectVocabulary.characterSet[viewModel.contentStore.characterSetSetting.rawValue] ?? "")
                                Text(incorrectVocabulary.pronunciationSet["zhuyin"] ?? "")
                                Text(incorrectVocabulary.pronunciationSet["pinyin"] ?? "")
                                Text(incorrectVocabulary.translation)
                            }
                        }
                    }
                }
                .foregroundColor(.white)
            }
            .padding()
        }
        .onTapGesture {
            viewModel.showResults = false
            dismiss()
        }
    }
}

struct Zhuyin_Previews: PreviewProvider {
    
    static var previews: some View {
        ZhuyinTestView(viewModel: ZhuyinViewModel(
            topic: TopicModel(topicName: "", topicImage: "", vocabulary: []),
            contentStore: dev.contentStore,
            analytics: dev.analytics)
        )
    }
}
