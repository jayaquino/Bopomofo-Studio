//
//  SoundManager.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 5/11/22.
//

import Foundation
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
