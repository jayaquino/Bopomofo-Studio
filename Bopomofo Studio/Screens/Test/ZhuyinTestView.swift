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
    @Environment(\.presentationMode) var presentationMode
    
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
                    
                    if viewModel.contentStore.testType == .zhuyin {
                        Text("High Score: " + String(UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(viewModel.contentStore.timerValue))))
                            .padding()
                            .frame(minWidth: Constants.screenWidth*8/10/2,alignment:.center)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                    }
                    else {
                        Text("High Score: " + String(UserDefaults.standard.integer(forKey: "highscore-pinyintozhuyin"+String(viewModel.contentStore.timerValue)))).padding()
                            .frame(minWidth: Constants.screenWidth*8/10/2,alignment:.center)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                    }
                }
                .padding()
                
                ZStack{
                    VStack{
                        Image(viewModel.displaySymbol)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 200)
                            .padding()
                               
                        if viewModel.contentStore.pronunciationTextMode == true {
                            Text(viewModel.randomSymbolExample)
                                .padding()
                                .opacity(0.5)
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
                    .padding(.horizontal)                    .onAppear {
                        focus = true
                    }
            }
            
            if viewModel.testFinished {
                ZStack{
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
                        switch viewModel.contentStore.testType {
                        case .zhuyin:
                            Text("High Score: \(UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(viewModel.contentStore.timerValue)))")
                                .foregroundColor(.white)
                                .font(.system(size:40))
                        case .pinyinToZhuyin:
                            Text("High Score: \(UserDefaults.standard.integer(forKey: "highscore-pinyintozhuyin"+String(viewModel.contentStore.timerValue)))")
                                .foregroundColor(.white)
                                .font(.system(size:40))
                        }
                    }
                    .padding()
                }
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.trackEvent(event: .beganTest(testSetting: viewModel.contentStore.timerValue.description))
        }
        .onDisappear {
            viewModel.trackEvent(event: .finishedTest(testSetting: viewModel.contentStore.timerValue.description))
        }
    }
}

struct Zhuyin_Previews: PreviewProvider {
    
    static var previews: some View {
        ZhuyinTestView(viewModel: ZhuyinViewModel(
            contentStore: ContentStore(provider: MockContentProvider()),
            analytics: dev.analytics,
            symbolList: ["ㄅ"],
            symbolPronunciation: ["ㄅ"])
        )
    }
}
