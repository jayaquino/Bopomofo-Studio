//
//  Zhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI
import Darwin

struct ZhuyinTestView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var settings : SettingsViewModel
    @ObservedObject var viewModel : ZhuyinViewModel
    let testList : TestList
    
    // Scoring
    @Binding var timerValue : Double
    @State var timeRemaining : Double
    
    init (viewModel : ZhuyinViewModel, testList : TestList, timerValue: Binding<Double>) {
        
        self.viewModel = viewModel
        self.testList = testList
        self._timerValue = timerValue
        
        self._timeRemaining = State(initialValue: timerValue.wrappedValue)
    }
    
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
                    
                    if settings.testType == "Zhuyin"{
                        Text("High Score: " + String(UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(timerValue))))
                            .padding()
                            .frame(minWidth: Constants.screenWidth*8/10/2,alignment:.center)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                    }
                    else {
                        Text("High Score: " + String(UserDefaults.standard.integer(forKey: "highscore-pinyintozhuyin"+String(timerValue)))).padding()
                            .frame(minWidth: Constants.screenWidth*8/10/2,alignment:.center)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                    }
                }
                
                ZStack{
                    VStack{
                        Text(viewModel.displaySymbol)
                            .padding()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .font(.system(size:150))
                            .foregroundColor(.accentColor)
                            .frame(height: 200)
                            .onAppear{let randomNumber = Int.random(in: 0...testList.zhuyinSymbols.count-1)
                                viewModel.randomSymbol = testList.zhuyinSymbols[randomNumber]
                                if settings.testType == "Zhuyin"{
                                    viewModel.displaySymbol = testList.zhuyinSymbols[randomNumber]
                                    viewModel.randomSymbolExample = testList.zhuyinSymbols[randomNumber]
                                } else {
                                    viewModel.displaySymbol = testList.pinyinSymbols[randomNumber]
                                    viewModel.randomSymbolExample = testList.pinyinSymbols[randomNumber]
                                }
                            }
                               
                        if settings.pronunciationTextMode == true {
                            Text(viewModel.randomSymbolExample)
                                .padding()
                                .opacity(0.5)
                        }
                    }
                    .frame(minHeight: Constants.screenHeight/3)
                }
                
                HStack{
                    Text("Time Remaining: \(String(format: "%.0f", timeRemaining)) s").onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
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
            
            if timeRemaining <= 0 {
                ZStack{
                    Color.accentColor
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Time Setting : \(String(format: "%.0f",timerValue)) seconds").foregroundColor(.white)
                        Text("Score: \(viewModel.score)")
                            .foregroundColor(.white)
                        Text("High Score: \(UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(timerValue)))")
                            .foregroundColor(.white)
                        Button("Return") {
                            if settings.testType == "Zhuyin"{
                                if viewModel.score > UserDefaults.standard.integer(forKey: "highscore-zhuyin"+String(timerValue)){
                                    UserDefaults.standard.set(viewModel.score, forKey: "highscore-zhuyin"+String(timerValue))
                                }
                            } else {
                                if viewModel.score > UserDefaults.standard.integer(forKey: "highscore-pinyinzhuyin"+String(timerValue)){
                                    UserDefaults.standard.set(viewModel.score, forKey: "highscore-pinyintozhuyin"+String(timerValue))
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
    }
}

struct KeyboardView: View {
    
    let keyboardRow : [String]
    let spacing : CGFloat
    let viewModel : ZhuyinViewModel
    @EnvironmentObject var settings : SettingsViewModel
    
    var body: some View {
        HStack(spacing: spacing){
            ForEach(keyboardRow, id: \.self) { symbol in
                Button(symbol) {
                    viewModel.checkSymbols(a:symbol,b:viewModel.randomSymbol)
                    viewModel.generateNewSymbol(pronunciationVoiceMode: settings.pronunciationVoiceMode, voiceSelection: settings.voiceSelection)
                }
                .font(.system(size: 20, weight: .medium))
                .frame(width: Constants.screenWidth/17)
            }
        }.padding(2)
    }
}



struct Zhuyin_Previews: PreviewProvider {
    
    static var previews: some View {
        ZhuyinTestView(viewModel: ZhuyinViewModel(testType: SettingsViewModel().testType), testList: TestList(),timerValue: .constant(3.0)).environmentObject(SettingsViewModel())
    }
}
