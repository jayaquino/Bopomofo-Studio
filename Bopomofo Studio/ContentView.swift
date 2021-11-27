//
//  ContentView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

////.background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))

import SwiftUI
import AVKit

class TestMode: ObservableObject{
     
    @Published var Zhuyin = "Zhuyin"
    @Published var PinyintoZhuyin = "PinyintoZhuyin"
    @Published var Vocabulary = "Vocabulary"

}

class SoundManager{
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    enum SoundOption:String{
        case ding
        case bonk
        case eng; case F_ㄅ; case F_ㄆ
        case F_ㄇ; case F_ㄉ; case F_ㄊ
        case F_ㄋ; case F_ㄌ
        
    }
    
    func playSound(sound: String){
        
        guard let url = Bundle.main.url(forResource: sound, withExtension:".mp3")
        else { return}
        do {
            player = try AVAudioPlayer(contentsOf:url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var testMode = TestMode()
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        NavigationView {

                    VStack {
                        Text("Bo ㄅ\n            Po ㄆ\n                      Mo ㄇ\n                                  Fo ㄈ\n")
                            .font(.title).bold().italic()
                            .foregroundColor(Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255))
                            .frame(minWidth:0,maxWidth:300)
                        Spacer()
                        Text("Studio")
                            .font(.system(size: 90))
                            .font(.title).bold().italic().underline()
                            .foregroundColor(teal)
                        Spacer()
                        Spacer()
                        NavigationLink(destination: Settings( testModeSelection: self.$testMode.Zhuyin)) {
                            Text("Zhuyin Characters")
                                .frame(minWidth: 0, maxWidth: 300)
                                .padding()
                                .foregroundColor(.white)
                                .background(teal)
                                .cornerRadius(40)
                                .font(.title).fixedSize()
                        }
                        NavigationLink(destination: Settings(testModeSelection: self.$testMode.PinyintoZhuyin)){
                            Text("Pinyin-to-Zhuyin")
                                .frame(minWidth: 0, maxWidth: 300)
                                .padding()
                                .foregroundColor(.white)
                                .background(teal)
                                .cornerRadius(40)
                                .font(.title)
                        }
                        NavigationLink(destination: Settings(testModeSelection: self.$testMode.Vocabulary)){
                            Text("Vocabulary")
                                .frame(minWidth: 0, maxWidth: 300)
                                .padding()
                                .foregroundColor(.white)
                                .background(teal)
                                .cornerRadius(40)
                                .font(.title)
                        }
                        Spacer()
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
