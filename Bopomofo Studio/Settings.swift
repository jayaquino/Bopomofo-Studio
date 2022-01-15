//
//  Settings.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI

class ModeSettings: ObservableObject{
    @Published var pronunciationTextMode = true
    @Published var pronunciationVoiceMode = false
    
}

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

struct Settings: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var modeSettings = ModeSettings()
    @ObservedObject var contents = Contents()
    @Binding var testModeSelection : String
    
    @State var timerValue: Double = 30
    @State var voiceSelection = "Female"
    
    var PreviewStartColor = Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255)
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    let voices = ["Female","Male"]

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var body: some View {
        VStack{
            
            Toggle("Pronunciation Text Assistance", isOn: self.$modeSettings.pronunciationTextMode)
                .padding()
            if testModeSelection == "Zhuyin" || testModeSelection == "PinyintoZhuyin"{
                VStack{
                    Toggle("Pronunciation Voice Assistance", isOn: self.$modeSettings.pronunciationVoiceMode)
                        .padding()
                    if self.modeSettings.pronunciationVoiceMode == true{
                        VStack{
                            Picker("Style", selection: $voiceSelection) {
                                ForEach(voices, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            Text("Voice Style")
                        }.padding()
                    }
                }
            }
            Spacer()
            HStack{
                Spacer()
                Slider(value: $timerValue, in: 30...300, step:1).padding(10)
                Spacer()
            }
            Text("Timer (s): \(timerValue, specifier: "%.2f")")
            if testModeSelection == "Zhuyin"{
                Text("The purpose of this section is to train your memory about the location of each Zhuyin in the iPhone style Zhuyin keyboard.")
                    .italic()
                    .padding()
                Spacer()
                NavigationLink(destination: ContentPreview(contentOne: self.$contents.zhuyin, contentTwo: self.$contents.pronunciation, pronunciationTextMode: self.$modeSettings.pronunciationTextMode, pronunciationVoiceMode: self.$modeSettings.pronunciationVoiceMode, voiceSelection: self.$voiceSelection ,timerValue: self.$timerValue, testModeSelection:self.$testModeSelection)){
                    Text("Preview")
                        .frame(width: 200, height: 30, alignment: .center)
                        .foregroundColor(teal)
                        .font(.system(size: 30, weight: .heavy))
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                
            }
            if testModeSelection == "PinyintoZhuyin"{
                Text("The purpose of this section is to learn the pronunciation of each Zhuyin character, coming from a Pinyin background.")
                    .italic()
                    .padding()
                Spacer()
                NavigationLink(destination: ContentPreview(contentOne: self.$contents.pinyinzhuyin, contentTwo: self.$contents.pronunciation,pronunciationTextMode: self.$modeSettings.pronunciationTextMode, pronunciationVoiceMode: self.$modeSettings.pronunciationVoiceMode, voiceSelection: self.$voiceSelection, timerValue: self.$timerValue, testModeSelection:self.$testModeSelection)){
                    Text("Preview")
                        .frame(width: 200, height: 30, alignment: .center)
                        .foregroundColor(teal)
                        .font(.system(size: 30, weight: .heavy))
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
            }
            if testModeSelection == "Vocabulary"{
                Text("The purpose of this section is to learn topic-based vocabulary. Select your topic and preview the vocabulary set.\n\nAfter you feel confident, test yourself. Or, you can have the vocabulary assistant turned on to go through the set with the pronunciation shown on the screen.")
                    .italic()
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: Vocabulary(pronunciationTextMode: self.$modeSettings.pronunciationTextMode,pronunciationVoiceMode: self.$modeSettings.pronunciationVoiceMode,voiceSelection: self.$voiceSelection, timerValue:self.$timerValue,testModeSelection:self.$testModeSelection)){
                    Text("Start")
                        .frame(width: 200, height: 30, alignment: .center)
                        .foregroundColor(teal)
                        .font(.system(size: 30, weight: .heavy))
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                        //.background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))
                    
                }
                
            }
            Spacer()
        }
    }
}

struct Settings_Previews: PreviewProvider {

    @State static var testModeSelection = ""
    
    static var previews: some View {
        Settings(testModeSelection: $testModeSelection)
    }
}
