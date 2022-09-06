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
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var router: Router
    @StateObject var viewModel: ContentPreviewViewModel
        
    var body: some View {
        VStack {
            ScrollView{
                if viewModel.contentStore.testType == .zhuyin {
                    HStack {
                        VStack{
                            ForEach(viewModel.contentStore.testList.zhuyinSymbols, id: \.self){symbol in
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
                            ForEach(viewModel.contentStore.testList.zhuyinPronunciation, id: \.self){symbol in
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
                            ForEach(viewModel.contentStore.testList.pinyinSymbols, id: \.self){symbol in
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
                            ForEach(viewModel.contentStore.testList.pinyinPronunciation, id: \.self){symbol in
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
            
            Slider(value: $viewModel.timerValue, in: 30...300, step:10).padding(10)
            
            Text("Timer (s): \(viewModel.timerValue, specifier: "%.2f")")
                .foregroundColor(.accentColor)
            
            NavigationLink(destination: router.zhuyinTestView()) {
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
        .navigationTitle("CONTENT_PREVIEW_TITLE")
        .navigationBarTitleDisplayMode(.inline)
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
}

struct ContentPreviewZhuyin_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentPreviewView(
            viewModel: ContentPreviewViewModel(contentStore: ContentStore(provider: MockContentProvider())))
    }
}
