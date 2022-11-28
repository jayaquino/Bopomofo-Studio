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
    
    func playMaleSound(sound: String) {
        guard let url = Bundle.main.url(forResource: "M_\(sound)", withExtension:".mp3")
        else { return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing male sound. \(error.localizedDescription)")
        }
    }
    
    func playFemaleSound(sound: String) {
        guard let url = Bundle.main.url(forResource: "F_\(sound)", withExtension:".mp3")
        else { return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing female sound. \(error.localizedDescription)")
        }
    }
}
