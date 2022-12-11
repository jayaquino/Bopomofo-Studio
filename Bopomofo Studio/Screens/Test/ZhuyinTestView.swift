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
        
        ZStack{
            VStack(alignment: .center) {
                HStack{
                    Text("Score: " + String(viewModel.score))
                        .padding()
                        .frame(minWidth: Constants.screenWidth*8/10/2,alignment:.center)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                    
                    Text("High Score: " + String(UserDefaults.standard.integer(forKey: viewModel.topic.topicName)))
                        .padding()
                        .frame(minWidth: Constants.screenWidth*8/10/2,alignment:.center)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                }
                .padding()
                
                ZStack{
                    VStack{
                        Group {
                            if LanguageHelper.isZhuyinOrPinyin(viewModel.randomSymbol) {
                                Image(viewModel.randomSymbol)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                            } else {
                                Text(viewModel.randomSymbol)
                                    .font(.system(size: 100))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: 100)
                                    .cornerRadius(16)
                                    .padding(5)
                            }
                        }
                        .frame(maxHeight: 200)

                    
                        
                        if viewModel.contentStore.pronunciationTextMode == true || viewModel.showPronunciation {
                            Text(viewModel.randomSymbolExample)
                                .frame(height: 30)
                                .opacity(0.5)
                        } else {
                            Text(" ")
                                .frame(height: 30)
                        }
                    }
                    .frame(minHeight: Constants.screenHeight/3)
                }
                
                HStack{
                    if viewModel.timer >= 1 {
                        Text("Time Remaining: \(String(format: "%.0f", viewModel.timer)) s").onReceive(timer) { _ in
                            if viewModel.timer > 0 {
                                viewModel.timer -= 1
                            }
                        }
                        
                        if !viewModel.isZhuyinOrPinyin {
                            Button {
                                viewModel.showPronunciation = true
                            } label: {
                                Text("Reveal Character")
                                    .font(.subheadline)
                                    .padding(.horizontal)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .disabled(viewModel.showPronunciation)
                            }
                            .buttonStyle(.plain)

                        }
                        
                    } else {
                        Text("Test Finished")
                            .fontWeight(.bold)
                    }
                }
                .foregroundColor(.accentColor)
                .font(.subheadline)
                
                TextField("Enter the character shown", text: $viewModel.inputSymbol)
                    .focused($focus)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onAppear {
                        focus.toggle()
                    }
            }
        }
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
                        .frame(width: Constants.screenWidth*2/3, height: 2)
                    
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
