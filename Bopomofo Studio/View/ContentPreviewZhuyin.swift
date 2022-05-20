//
//  ContentPreviewZhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/25/22.
//

import SwiftUI

struct ContentPreviewZhuyin: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var settings: SettingsViewModel
    @State var timerValue = 30.0
    
    let testList = TestList()
    
    var body: some View {
        VStack{
            ScrollView{
                if settings.testType == "Zhuyin"{
                    HStack {
                        VStack{
                            ForEach(testList.zhuyinSymbols, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("chalkboard se", size: 18))
                                    .font(.system(size: 18, weight: .thin))
                                    .frame(minHeight:100)
                                    .frame(minWidth: Constants.screenWidth/3)
                                    .multilineTextAlignment(.center)
                                    .background(Color("AppColor"))
                                    .cornerRadius(30)
                            }
                        }.padding()
                        
                        VStack{
                            ForEach(testList.zhuyinPronunciation, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("chalkboard se",size: 20))
                                    .font(.system(size: 20, weight: .black))
                                    .frame(minHeight:100)
                                    .frame(minWidth: Constants.screenWidth/2)
                                    .multilineTextAlignment(.center)
                                    .background(Color("AppColor"))
                                    .cornerRadius(30)
                            }
                        }.padding()
                    }
                } else {
                    HStack{
                        VStack{
                            ForEach(testList.pinyinSymbols, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("chalkboard se", size: 18))
                                    .font(.system(size: 18, weight: .thin))
                                    .frame(minHeight:100)
                                    .frame(minWidth: Constants.screenWidth/3)
                                    .multilineTextAlignment(.center)
                                    .background(Color("AppColor"))
                                    .cornerRadius(30)
                            }
                        }.padding()
                        
                        VStack{
                            ForEach(testList.pinyinPronunciation, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("chalkboard se",size: 20))
                                    .font(.system(size: 20, weight: .black))
                                    .frame(minHeight:100)
                                    .frame(minWidth: Constants.screenWidth/2)
                                    .multilineTextAlignment(.center)
                                    .background(Color("AppColor"))
                                    .cornerRadius(30)
                            }
                        }.padding()
                    }
                }
            }
            .foregroundColor(.accentColor)
            
            Slider(value: $timerValue, in: 30...300, step:10).padding(10)
            
            Text("Timer (s): \(timerValue, specifier: "%.2f")")
                .foregroundColor(.accentColor)
            
            NavigationLink(destination: Zhuyin(viewModel: ZhuyinViewModel(testType: settings.testType), testList: TestList(), timerValue: $timerValue)){
                Text("Start")
                    .frame(width: 200, height: 30, alignment: .center)
                    .font(.system(size: 30, weight: .medium))
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(30)
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}

struct ContentPreviewZhuyin_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentPreviewZhuyin().environmentObject(SettingsViewModel())
    }
}
