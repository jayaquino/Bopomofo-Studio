//
//  Settings.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI

class ModeSettings: ObservableObject{
    @Published var pronunciation = true
}

class Contents: ObservableObject{
    @Published var zhuyin = ["ㄅ","ㄉ","ˇ","ˋ","ㄓ","ˊ","˙","ㄚ","ㄞ","ㄢ","ㄦ",
    "ㄆ","ㄊ","ㄍ","ㄐ","ㄔ","ㄗ","ㄧ","ㄛ","ㄟ","ㄣ","ㄇ","ㄋ","ㄎ","ㄑ","ㄕ","ㄘ","ㄨ","ㄜ","ㄠ","ㄤ","ㄈ","ㄌ","ㄏ","ㄒ","ㄖ","ㄙ","ㄩ","ㄝ","ㄡ","ㄥ"]
    
    @Published var pinyinzhuyin = ["b","d","ˇ","ˋ","zh","ˊ","˙","a","ai","an","er",
                                    "p","t","g","j","ch","z","i","o","ei","en","m","n","k","q","sh","c","wu","e","ao","ang","f","l","h","x","r","s","ü","eh","ou","eng"]
    @Published var pronunciation =
        ["b in boy",
         "d in dad",
         "",
         "",
         "je in jerk",
         "",
         "",
         "a in fat",
         "igh in sigh",
         "an in iguana",
         "ur in fur",
         "p in pout",
         "t in tone",
         "g in iguana",
         "j in june",
         "ch in choke",
         "z in zip",
         "i in iguana",
         "o in go",
         "ay in lay",
         "en in pen",
         "m in mom",
         "n in no",
         "k in kit",
         "like the ch sound, using kissy lips",
         "sh in shot",
         "ts in cats",
         "u in iguana",
         "u in shut",
         "ow in cow",
         "a + nasal sound",
         "f in fat",
         "l in low",
         "h in how",
         "sh in sheesh",
         "r in drought",
         "s in soon",
         "ü in june",
         "e in yet",
         "ow in row",
         "ngue in tongue"]
}

struct Settings: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var modeSettings = ModeSettings()
    @ObservedObject var contents = Contents()
    @Binding var testModeSelection : String
    
    @State var timerValue: Double = 30
    
    var body: some View {
        VStack{
            Toggle("Pronunciation Assistance", isOn: self.$modeSettings.pronunciation)
                .padding()
            
            if testModeSelection == "Zhuyin"{
                Text("The purpose of this section is to train your memory about the location of each Zhuyin in the iPhone style Zhuyin keyboard.")
                    .italic()
                    .padding()
                Spacer()
                NavigationView{
                NavigationLink(destination: ContentPreview(contentOne: self.$contents.zhuyin, contentTwo: self.$contents.pronunciation)){
                    Text("Preview Content")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                }}
                NavigationLink(destination: Zhuyin(pronunciation: self.$modeSettings.pronunciation)){
                    Text("Start")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                }
            }
            if testModeSelection == "PinyintoZhuyin"{
                Text("The purpose of this section is to learn the pronunciation of each Zhuyin character, coming from a Pinyin background.")
                    .italic()
                    .padding()
                Spacer()
                NavigationView{
                NavigationLink(destination: ContentPreview(contentOne: self.$contents.pinyinzhuyin, contentTwo: self.$contents.pronunciation)){
                    Text("Preview Content")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                }}
                NavigationLink(destination: PinyinZhuyin(pronunciation: self.$modeSettings.pronunciation)){
                    Text("Start")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                }
            }
            if testModeSelection == "Vocabulary"{
                Text("The purpose of this section is to learn topic-based vocabulary. Select your topic and preview the vocabulary set.\n\nAfter you feel confident, test yourself. Or, you can have the vocabulary assistant turned on to go through the set with the pronunciation shown on the screen.")
                    .italic()
                    .padding()
                Spacer()
                HStack{
                    Spacer()
                    Slider(value: $timerValue, in: 30...300, step:1)
                    Spacer()
                }
                Text("Timer (s): \(timerValue, specifier: "%.2f")")
                Spacer()
                NavigationLink(destination: Vocabulary(pronunciation: self.$modeSettings.pronunciation,timerValue:self.$timerValue)){
                    Text("Start")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {

    @State static var testModeSelection = ""
    
    static var previews: some View {
        Settings(testModeSelection: $testModeSelection)
    }
}
