//
//  ContentPreviewZhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/25/22.
//

import SwiftUI

struct ContentPreviewZhuyin: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contentOne : [String]
    @Binding var contentTwo : [String]
    @Binding var pronunciationTextMode: Bool
    @Binding var pronunciationVoiceMode: Bool
    @Binding var voiceSelection: String
    @Binding var timerValue: Double
    @Binding var testModeSelection: String
    
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        VStack{
            HStack{
                ScrollView{
                    HStack{
                        VStack{
                            ForEach(contentOne, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("chalkboard se", size: 18))
                                    .font(.system(size: 18, weight: .thin))
                            }
                            .frame(minHeight:100)
                            .frame(minWidth: screenWidth/2)
                            .multilineTextAlignment(.center)
                        }
                        
                        VStack{
                            ForEach(contentTwo, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("chalkboard se",size: 20))
                                    .font(.system(size: 20, weight: .black))
                            }
                            .frame(minHeight:100)
                            .frame(minWidth: screenWidth/3)
                            .multilineTextAlignment(.center)
                            
                        }
                    }
                }
            }
            NavigationLink(destination: Zhuyin(pronunciationTextMode: self.$pronunciationTextMode,pronunciationVoiceMode:self.$pronunciationVoiceMode, voiceSelection:self.$voiceSelection, timerValue: self.$timerValue,testModeSelection: $testModeSelection)){
                Text("Start")
                    .frame(width: 200, height: 30, alignment: .center)
                    .foregroundColor(teal)
                    .font(.system(size: 30, weight: .heavy))
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300)
            }
            
            Spacer()
            
        }
    }
    
    
}

struct ContentPreviewZhuyin_Previews: PreviewProvider {
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    @State static var pronunciationTextMode = true
    @State static var pronunciationVoiceMode = true
    @State static var voiceSelection = ""
    @State static var timerValue = 1.1
    @State static var testModeSelection = ""
    
    static var previews: some View {
        ContentPreviewZhuyin(contentOne: $contentOne, contentTwo: $contentTwo, pronunciationTextMode: $pronunciationTextMode, pronunciationVoiceMode: $pronunciationVoiceMode, voiceSelection: $voiceSelection, timerValue: $timerValue,testModeSelection: $testModeSelection)
    }
}
