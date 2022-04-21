//
//  Flashcard.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/4/22.
//

import SwiftUI
import GoogleMobileAds

struct Flashcard: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contentOne: [String]
    @Binding var contentTwo: [String]
    
    @State var contentOneValue: [String]
    @State var contentTwoValue: [String]
    
    @State var randomSymbol:String = ""
    @State var randomKey:String = ""
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    init(contentOne: Binding<[String]>,contentTwo: Binding<[String]>){
        _contentOne = contentOne
        _contentOneValue = State(initialValue: contentOne.wrappedValue)
        _contentTwo = contentTwo
        _contentTwoValue = State(initialValue: contentTwo.wrappedValue)

    }
    
    
    func generateNewSymbol() {
            let randomNumber = Int.random(in: 0...contentOneValue.count-1)
            randomSymbol = contentOneValue[randomNumber]
            randomKey = contentTwoValue[randomNumber]
            contentOneValue.remove(at:randomNumber)
            contentTwoValue.remove(at:randomNumber)
    }
    
    
    @State var flipper = "0"
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
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
            VStack{
                if flipper == "0" {
                    Text("?")
                        .padding()
                        .frame(width: screenWidth, height: screenHeight/5)
                        .font(.custom("chalkboard se",size: 90))
                        .foregroundColor(teal)
                    
                }
                if flipper == "1" {
                    Text(randomKey)
                        .padding()
                        .frame(width: screenWidth, height: screenHeight/5)
                        .font(.custom("chalkboard se",size: 30))
                        .foregroundColor(teal)
                }
                Text("")
                    .frame(width: screenWidth*9/10, height: 2)
                    .background(teal)
                    .padding()
                    .shadow(radius: 2)
                Text(randomSymbol)
                    .padding()
                    .frame(width: screenWidth, height: screenHeight/5, alignment:.center)
                    .font(.custom("copperplate",size: 30))
                    .foregroundColor(teal)
            }
            Spacer()
            Button("Next"){
                if flipper == "0" {
                    flipper = "1"
                }
                else if flipper == "1" {
                    if contentOneValue.count == 0 {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    else {generateNewSymbol()}
                    flipper = "0"
                }
                
            }
            .frame(width: screenWidth*9/10, height: screenHeight/5)
            .onAppear(perform: generateNewSymbol)
            .font(.custom("copperplate",size: 90))
            .foregroundColor(.white)
            .background(teal)
            .cornerRadius(screenHeight)
            .shadow(radius: 20)
            Spacer()
            
            
            
            
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

struct Flashcard_Previews: PreviewProvider {
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    static var previews: some View {
        Flashcard(contentOne: $contentOne,contentTwo: $contentTwo)
    }
}
