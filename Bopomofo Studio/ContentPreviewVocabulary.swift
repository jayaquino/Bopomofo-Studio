//
//  ContentPreviewVocabulary.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/25/22.
//

import SwiftUI
import GoogleMobileAds

struct ContentPreviewVocabulary: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contentOne : [String]
    @Binding var contentTwo : [String]
    @Binding var pronunciationTextMode: Bool
    @Binding var timerValue: Double
    @Binding var previewID: String
    @Binding var testType: String
    
    @State var contentOneTestValues : [String]
    @State var contentTwoTestValues : [String]
    @State var contentOneIndex : Range<Int>
    @State var contentOneValue : Array<Int>
    
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    init(contentOne: Binding<[String]>,contentTwo: Binding<[String]>,previewID:Binding<String>,pronunciationTextMode: Binding<Bool>,timerValue: Binding<Double>,testType:Binding<String>){
        _contentOne = contentOne
        _contentOneTestValues = State(initialValue: contentOne.wrappedValue)
        _contentOneIndex = State(initialValue: 0..<contentOne.count)
        _contentOneValue = State(initialValue: Array(repeating: 0, count:contentOne.count))
        _contentTwo = contentTwo
        _contentTwoTestValues = State(initialValue: contentTwo.wrappedValue)
        _previewID = previewID
        _pronunciationTextMode = pronunciationTextMode
        _timerValue = timerValue
        _testType = testType
    }
    
    // Ads
    @State var height: CGFloat = 0
    @State var width: CGFloat = 0
    let adUnitId = "ca-app-pub-1023765231299220/8192916298"
    
    var body: some View {
        VStack{
            BannerAd(adUnitId: adUnitId)
                .frame(width: width, height: height, alignment: .center)
                .onAppear {
                    setFrame()
                }
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
            }
            
            if contentOneTestValues.count >= 1 {
                if testType == "Bopomofo"{
                    NavigationLink(destination: Test(contentOne: self.$contentOneTestValues, contentTwo: self.$contentTwoTestValues, previewID:self.$previewID, pronunciationTextMode: self.$pronunciationTextMode, timerValue: self.$timerValue)){
                        Text("Start Test")
                    }
                    .foregroundColor(teal)
                    .padding(10)
                    .font(.system(size: 30, weight: .heavy))
                    .frame(width: screenWidth*9/10, height: screenHeight/8, alignment: .center)
                }
                if testType == "Flashcards"{
                    NavigationLink(destination: Flashcard(contentOne: self.$contentOneTestValues, contentTwo: self.$contentTwoTestValues)){
                        Text("Start Test")
                    }
                    .foregroundColor(teal)
                    .padding(10)
                    .font(.system(size: 30, weight: .heavy))
                    .frame(width: screenWidth*9/10, height: screenHeight/8, alignment: .center)
                }
            }
        }
    }
    func setFrame() {
        
        //Get the frame of the safe area
        let safeAreaInsets = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero
        let frame = UIScreen.main.bounds.inset(by: safeAreaInsets)
        
        //Use the frame to determine the size of the ad
        let adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(frame.width)
        
        //Set the ads frame
        self.width = adSize.size.width
        self.height = adSize.size.height
    }
}

struct ContentPreviewVocabulary_Previews: PreviewProvider {
    
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    @State static var pronunciationTextMode = true
    @State static var timerValue = 1.1
    @State static var previewID = ""
    @State static var testType = ""
    static var previews: some View {
        ContentPreviewVocabulary(contentOne:$contentOne, contentTwo:$contentTwo, previewID:$previewID, pronunciationTextMode:$pronunciationTextMode,timerValue:$timerValue,testType: $testType)
    }
}
