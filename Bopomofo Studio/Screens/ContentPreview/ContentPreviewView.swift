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
        
    @State var scale = 0.8

    var body: some View {
        VStack(spacing: 0) {
            ScrollView{
                VStack(spacing: 40) {
                    ForEach(viewModel.contentStore.testList.zhuyinPronunciation, id: \.self) { testPronunciation in
                        TestContentCell(
                            image: "BPMF",
                            description: testPronunciation
                        )
                    }
                }
            }
            .foregroundColor(.accentColor)
            
            Divider()
            
            Slider(value: $viewModel.timerValue, in: 30...300, step:10).padding(10)
            
            Text("Timer (s): \(viewModel.timerValue, specifier: "%.2f")")
                .foregroundColor(.accentColor)
            
            NavigationLink(destination: router.zhuyinTestView()) {
                Text("Start")
                    .frame(width: 150, height: 20, alignment: .center)
                    .font(.system(size: 30, weight: .medium))
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(20)
                    .foregroundColor(.white)
            }
            .padding()
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
            viewModel: ContentPreviewViewModel(contentStore: ContentStore(provider: MockContentProvider())))
        .environmentObject(dev.router)
    }
}
