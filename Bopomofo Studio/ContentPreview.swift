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
    @Binding var previewID: String

    @State var contentOneTestValues : [String]
    @State var contentTwoTestValues : [String]
    @State var contentOneIndex : Range<Int>
    @State var contentOneValue : Array<Int>
    
    @State var testType = "Bopomofo"
    let testTypes = ["Bopomofo","Flashcards"]
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var PreviewStartColor = Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255)
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    init(contentOne: Binding<[String]>,contentTwo: Binding<[String]>,previewID:Binding<String>,pronunciationTextMode: Binding<Bool>,pronunciationVoiceMode:Binding<Bool>,voiceSelection:Binding<String>,timerValue: Binding<Double>,testModeSelection:Binding<String>){
        _contentOne = contentOne
        _contentOneTestValues = State(initialValue: contentOne.wrappedValue)
        _contentOneIndex = State(initialValue: 0..<contentOne.count)
        _contentOneValue = State(initialValue: Array(repeating: 0, count:contentOne.count))
        _contentTwo = contentTwo
        _contentTwoTestValues = State(initialValue: contentTwo.wrappedValue)
        _previewID = previewID
        _pronunciationTextMode = pronunciationTextMode
        _pronunciationVoiceMode = pronunciationVoiceMode
        _voiceSelection = voiceSelection
        _timerValue = timerValue
        _testModeSelection = testModeSelection
    }
    
    var counter = 0
    
    var body: some View {
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
                        if(testModeSelection == "Vocabulary"){
                            VStack{
                                ForEach(contentOneIndex, id: \.self){symbol in
                                    ZStack{
                                        
                                        if contentOneValue[symbol] == 0 {
                                            Image("Checked")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .aspectRatio(contentMode: .fit)
                                        }
                                        else if contentOneValue[symbol] == 1 {
                                            Image("Unchecked")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .aspectRatio(contentMode: .fit)
                                        }
                                        Button(" ") {
                                            if contentOneValue[symbol] == 0 {
                                                contentOneValue[symbol] = 1
                                                if let location = contentOneTestValues.firstIndex(of:contentOne[symbol]){
                                                    contentOneTestValues.remove(at: location)
                                                    contentTwoTestValues.remove(at: location)
                                                }
                                            }
                                            else if contentOneValue[symbol] == 1 {
                                                contentOneValue[symbol] = 0
                                                contentOneTestValues.append(contentOne[symbol])
                                                contentTwoTestValues.append(contentTwo[symbol])
                                            }
                                        }.frame(width: 20, height: 20)
                                    }
                                }
                                .frame(minHeight:100)
                                .frame(minWidth: screenWidth/10,alignment:.leading)
                                .multilineTextAlignment(.center)
                                
                            }
                        }
                        
                    }
                
                if(testModeSelection == "Vocabulary"){
                    Picker("Style", selection: $testType) {
                        ForEach(testTypes, id: \.self) {
                            Text($0)
                            .padding()
                            .font(.custom("copperplate",size: 30))
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: screenWidth, height: 100)
                    .padding()
                    if testType == "Bopomofo"{
                        NavigationLink(destination: Test(contentOne: self.$contentOneTestValues, contentTwo: self.$contentTwoTestValues, previewID:self.$previewID, pronunciationTextMode: self.$pronunciationTextMode, timerValue: self.$timerValue)){
                        Text("Start Test")
                        }
                        .foregroundColor(teal)
                        .padding(10)
                        .font(.system(size: 30, weight: .heavy))
                    }
                    if testType == "Flashcards"{
                        NavigationLink(destination: Flashcard(contentOne: self.$contentOneTestValues, contentTwo: self.$contentTwoTestValues, pronunciationTextMode: self.$pronunciationTextMode, timerValue: self.$timerValue)){
                        Text("Start Test")
                        }
                        .foregroundColor(teal)
                        .padding(10)
                        .font(.system(size: 30, weight: .heavy))
                    }
                    
                }
                else if (testModeSelection == "Zhuyin"){
                    NavigationLink(destination: Zhuyin(pronunciationTextMode: self.$pronunciationTextMode,pronunciationVoiceMode:self.$pronunciationVoiceMode, voiceSelection:self.$voiceSelection, timerValue: self.$timerValue,testModeSelection:self.$testModeSelection)){
                        Text("Start")
                            .frame(width: 200, height: 30, alignment: .center)
                            //.navigationBarHidden(true)
                            //.navigationBarTitle("")
                            .foregroundColor(teal)
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
                            .foregroundColor(teal)
                            .font(.system(size: 30, weight: .heavy))
                            .padding()
                            .frame(minWidth: 0, maxWidth: 300)
                    }
                }
                Spacer()
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
    @State static var previewID = ""

    static var previews: some View {
        ContentPreview(contentOne:$contentOne, contentTwo:$contentTwo, previewID:$previewID, pronunciationTextMode:$pronunciationTextMode,pronunciationVoiceMode:$pronunciationVoiceMode, voiceSelection:$voiceSelection,timerValue:$timerValue, testModeSelection: $testModeSelection)
    }
}
