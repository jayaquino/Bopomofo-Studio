//
//  ContentView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI
import AVKit

class SoundManager{
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
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

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    let textBPMFSize = CGFloat(60)
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HStack{
                    
                    Text("Bo ㄅ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                    Text("Po ㄆ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Spacer()
                    Text("Mo ㄇ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                    Text("Fo ㄈ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                }
                
                
                HStack{
                    Spacer()
                    Spacer()
                    Text("Studio")
                        .font(.custom("copperplate", size: 70))
                        .foregroundColor(teal)
                        .padding()
                }
                
                NavigationLink(destination: ZhuyinSettings()) {
                    Text("Zhuyin")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(teal)
                        .cornerRadius(40)
                }

                NavigationLink(destination: VocabularySettings()){
                    Text("Vocabulary")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(teal)
                        .cornerRadius(40)
                    
                }
                
            }
            .font(.custom("copperplate", size: 20))
            .foregroundColor(teal)
            .frame(minWidth:0,maxWidth:screenWidth)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
