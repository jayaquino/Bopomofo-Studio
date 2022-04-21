//
//  ContentPreviewZhuyin.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 1/25/22.
//

import SwiftUI
import GoogleMobileAds

class Contents: ObservableObject{
    @Published var zhuyin = ["ㄅ","ㄆ","ㄇ","ㄈ","ㄉ","ㄊ","ㄋ","ㄌ","ˇ","ㄍ","ㄎ",
                             "ㄏ","ˋ","ㄐ","ㄑ","ㄒ","ㄓ","ㄔ","ㄕ","ㄖ"," ˊ ","ㄗ","ㄘ","ㄙ","˙","ㄧ","ㄨ","ㄩ","ㄚ","ㄛ","ㄜ","ㄝ","ㄞ","ㄟ","ㄠ","ㄡ","ㄢ","ㄣ","ㄤ","ㄥ","ㄦ"]
    
    @Published var pinyinzhuyin = ["b","p","m","f","d","t","n","l","ˇ","g","k",
                                   "h","ˋ","j","q","x","zh","ch","sh","r","ˊ","z","c","s","˙","i","u","ü","a","o","e","e ","ai","ei","ao","ou","an","en","ang","eng","er"]
    @Published var pronunciation =
    ["ㄅ b in boy",
     "ㄆ p in pout",
     "ㄇ m in mom",
     "ㄈ f in fat",
     "ㄉ d in dad",
     "ㄊ t in tone",
     "ㄋ n in no",
     "ㄌ l in low",
     "ˇ 3rd tone",
     "ㄍ g in iguana",
     "ㄎ k in kit",
     "ㄏ h in how",
     "ˋ 4th tone",
     "ㄐ j in june",
     "ㄑ like the ch sound, using kissy lips",
     "ㄒ sh in sheesh",
     "ㄓ je in jerk",
     "ㄔ ch in choke",
     "ㄕ sh in shot",
     "ㄖ r in drought",
     "ˊ 2nd tone",
     "ㄗ z in zip",
     "ㄘ ts in cats",
     "ㄙ s in soon",
     "˙ neutral tone",
     "ㄧ i in iguana",
     "ㄨ u in iguana",
     "ㄩ ü in june",
     "ㄚ a in fat",
     "ㄛ o in go",
     "ㄜ uh in duh",
     "ㄝ e in yet",
     "ㄞ igh in sigh",
     "ㄟ ay in lay",
     "ㄠ ow in cow",
     "ㄡ ow in row",
     "ㄢ an in iguana",
     "ㄣ en in pen",
     "ㄤ a + nasal sound",
     "ㄥ ngue in tongue",
     "ㄦ ur in fur"]
}

struct ContentPreviewZhuyin: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pronunciationTextMode: Bool
    @Binding var pronunciationVoiceMode: Bool
    @Binding var voiceSelection: String
    @Binding var timerValue: Double
    @Binding var testType: String
    
    @ObservedObject var contents = Contents()
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    //Ad
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
                    if testType == "Zhuyin"{
                        HStack{
                            VStack{
                                ForEach(contents.zhuyin, id: \.self){symbol in
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
                                ForEach(contents.pronunciation, id: \.self){symbol in
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
                    else if testType == "Pinyin To Zhuyin"{
                        HStack{
                            VStack{
                                ForEach(contents.zhuyin, id: \.self){symbol in
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
                                ForEach(contents.pinyinzhuyin, id: \.self){symbol in
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
            }
            NavigationLink(destination: Zhuyin(pronunciationTextMode: self.$pronunciationTextMode,pronunciationVoiceMode:self.$pronunciationVoiceMode, voiceSelection:self.$voiceSelection, timerValue: self.$timerValue,testModeSelection: $testType)){
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

struct ContentPreviewZhuyin_Previews: PreviewProvider {
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    @State static var pronunciationTextMode = true
    @State static var pronunciationVoiceMode = true
    @State static var voiceSelection = ""
    @State static var timerValue = 1.1
    @State static var testModeSelection = ""
    
    static var previews: some View {
        ContentPreviewZhuyin(pronunciationTextMode: $pronunciationTextMode, pronunciationVoiceMode: $pronunciationVoiceMode, voiceSelection: $voiceSelection, timerValue: $timerValue,testType: $testModeSelection)
    }
}
