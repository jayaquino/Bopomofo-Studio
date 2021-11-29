//
//  ContentPreview.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI

struct ContentPreview: View {
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
    
    var PreviewStartColor = Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255)
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        HStack{
            
            ScrollView{
                    
                    HStack{
                        VStack{
                            ForEach(contentOne, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("Chalkboard SE", size: 18))
                                    .font(.system(size: 18, weight: .thin))
                            }
                            .frame(minHeight:75)
                            .frame(minWidth: 100)
                            .multilineTextAlignment(.center)
                        }
                        
                        VStack{
                            ForEach(contentTwo, id: \.self){symbol in
                                Text(symbol)
                                    .padding(2)
                                    .font(.custom("Chalkboard SE",size: 20))
                                    .font(.system(size: 20, weight: .black))
                            }
                            .frame(minHeight:75)
                            .frame(minWidth: 150)
                            .multilineTextAlignment(.center)
                           
                        }
                        
                    }
                if(testModeSelection == "Vocabulary"){
                    NavigationLink(destination: Test(contentOne: self.$contentOne, contentTwo: self.$contentTwo, pronunciationTextMode: self.$pronunciationTextMode, timerValue: self.$timerValue)){
                    Text("Start Test")
                    }
                    .foregroundColor(PreviewStartColor)
                    .padding(10)
                    .font(.system(size: 30, weight: .heavy))
                    //.disabled(self.vocabularyTranslation == [""])
                }
                else if (testModeSelection == "Zhuyin"){
                    NavigationLink(destination: Zhuyin(pronunciationTextMode: self.$pronunciationTextMode,pronunciationVoiceMode:self.$pronunciationVoiceMode, voiceSelection:self.$voiceSelection, timerValue: self.$timerValue,testModeSelection:self.$testModeSelection)){
                        Text("Start")
                            .frame(width: 200, height: 30, alignment: .center)
                            //.navigationBarHidden(true)
                            //.navigationBarTitle("")
                            .foregroundColor(PreviewStartColor)
                            .font(.system(size: 30, weight: .heavy))
                            .padding()
                            .frame(minWidth: 0, maxWidth: 300)
                    }
                }
                else if (testModeSelection == "PinyintoZhuyin"){
                    NavigationLink(destination: Zhuyin(pronunciationTextMode: self.$pronunciationTextMode, pronunciationVoiceMode: self.$pronunciationVoiceMode, voiceSelection:self.$voiceSelection,timerValue: self.$timerValue, testModeSelection: self.$testModeSelection)){
                        Text("Start")
                            .frame(width: 200, height: 30, alignment: .center)
                            //.navigationBarHidden(true)
                            //.navigationBarTitle("")
                            .foregroundColor(PreviewStartColor)
                            .font(.system(size: 30, weight: .heavy))
                            .padding()
                            .frame(minWidth: 0, maxWidth: 300)
                    }
                }
            }
        }
    }
}

struct ContentPreview_Previews: PreviewProvider {
    
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    @State static var pronunciationTextMode = true
    @State static var pronunciationVoiceMode = true
    @State static var voiceSelection = ""
    @State static var timerValue = 1.1
    @State static var testModeSelection = ""

    static var previews: some View {
        ContentPreview(contentOne:$contentOne, contentTwo:$contentTwo, pronunciationTextMode:$pronunciationTextMode,pronunciationVoiceMode:$pronunciationVoiceMode, voiceSelection:$voiceSelection,timerValue:$timerValue, testModeSelection: $testModeSelection)
    }
}
