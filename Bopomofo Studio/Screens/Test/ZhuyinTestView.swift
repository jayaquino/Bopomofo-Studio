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
                        Text(viewModel.displaySymbol)
                            .padding()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .font(.system(size:150))
                            .foregroundColor(.accentColor)
                            .frame(height: 200)
                            .onAppear{let randomNumber = Int.random(in: 0...viewModel.contentStore.testList.zhuyinSymbols.count-1)
                                viewModel.randomSymbol = viewModel.contentStore.testList.zhuyinSymbols[randomNumber]
                                if viewModel.contentStore.testType == .zhuyin {
                                    viewModel.displaySymbol = viewModel.contentStore.testList.zhuyinSymbols[randomNumber]
                                    viewModel.randomSymbolExample = viewModel.contentStore.testList.zhuyinSymbols[randomNumber]
                                } else {
                                    viewModel.displaySymbol = viewModel.contentStore.testList.pinyinSymbols[randomNumber]
                                    viewModel.randomSymbolExample = viewModel.contentStore.testList.pinyinSymbols[randomNumber]
                                }
                            }
                               
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
                Spacer()
                KeyboardView(keyboardRow: viewModel.keyboardRow1, spacing: Constants.screenWidth/30, viewModel: viewModel)
                KeyboardView(keyboardRow: viewModel.keyboardRow2, spacing: Constants.screenWidth/34, viewModel: viewModel)
                KeyboardView(keyboardRow: viewModel.keyboardRow3, spacing: Constants.screenWidth/38, viewModel: viewModel)
                KeyboardView(keyboardRow: viewModel.keyboardRow4, spacing: Constants.screenWidth/30, viewModel: viewModel)
                Spacer()
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
                        }
                        Text("High Score: \(UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(viewModel.contentStore.timerValue)))")
                            .foregroundColor(.white)
                        Button("Return") {
                            if viewModel.contentStore.testType == .zhuyin {
                                if viewModel.score > UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(viewModel.contentStore.timerValue)){
                                    UserDefaults.standard.set(viewModel.score, forKey: "highscore-zhuyin"+String(viewModel.contentStore.timerValue))
                                }
                            } else {
                                if viewModel.score > UserDefaults.standard.integer(forKey: "highscore-pinyinzhuyin"+String(viewModel.contentStore.timerValue)){
                                    UserDefaults.standard.set(viewModel.score, forKey: "highscore-pinyintozhuyin"+String(viewModel.contentStore.timerValue))
                                }
                            }
                            ReviewManager.shared.updateSessionsCompleted()
                            presentationMode.wrappedValue.dismiss()
                        }
                        .foregroundColor(.white)
                        .font(.system(size:70))
                    }
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

struct KeyboardView: View {
    
    let keyboardRow : [String]
    let spacing : CGFloat
    let viewModel : ZhuyinViewModel
    
    var body: some View {
        HStack(spacing: spacing){
            ForEach(keyboardRow, id: \.self) { symbol in
                Button(symbol) {
                    viewModel.checkSymbols(a:symbol,b:viewModel.randomSymbol)
                    viewModel.generateNewSymbol(pronunciationVoiceMode: viewModel.contentStore.pronunciationVoiceMode, voiceSelection: viewModel.contentStore.voiceSelection.rawValue)
                }
                .font(.system(size: 20, weight: .medium))
                .frame(width: Constants.screenWidth/17)
            }
        }.padding(2)
    }
}



struct Zhuyin_Previews: PreviewProvider {
    
    static var previews: some View {
        ZhuyinTestView(viewModel: ZhuyinViewModel(
            contentStore: ContentStore(provider: MockContentProvider()),
            analytics: dev.analytics)
        )
    }
}
