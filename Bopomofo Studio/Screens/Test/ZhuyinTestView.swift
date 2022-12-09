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
                        Image(viewModel.randomSymbol)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 200)
                            .padding()
                               
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
                    Text("Time Remaining: \(String(format: "%.0f", viewModel.timer)) s").onReceive(timer) { _ in
                        if viewModel.timer > 0 {
                            viewModel.timer -= 1
                        }
                    }
                    .foregroundColor(.accentColor)
                    .font(.title2)
                }
                
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
            ZStack {
                Color.accentColor
                    .edgesIgnoringSafeArea(.all)
                VStack (spacing: 10) {
                    Text("Time Setting : \(String(format: "%.0f",viewModel.contentStore.timerValue)) seconds").foregroundColor(.white)
                    Text(viewModel.score > 0 ? "Score: \(viewModel.score)" : "Try Again!")
                        .foregroundColor(.white)
                    if let scorePercentage = viewModel.scorePercentage {
                        Text("Your score beats or equals \(scorePercentage , specifier: "%.1f")% of people who took this test!")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    } else if viewModel.score != 0 {
                        ProgressView()
                            .tint(.white)
                    }
                    Text("High Score: \(UserDefaults.standard.integer(forKey: viewModel.topic.topicName))")
                        .foregroundColor(.white)
                        .font(.system(size:40))
                }
                .padding()
            }
            .onTapGesture {
                viewModel.showResults = false
                dismiss()
            }
            .onAppear {
                viewModel.trackEvent(event: .finishedTest(testSetting: viewModel.contentStore.timerValue.description))
            }
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
