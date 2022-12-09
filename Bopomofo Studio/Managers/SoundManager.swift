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
    private let synth = AVSpeechSynthesizer()

    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch let error {
            print("Error setting AVAudioSession category", error.localizedDescription)
        }
    }
    
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
    
    func utterSound(
        sound: String,
        rate: Float
    ) {
        let utterance = AVSpeechUtterance(string: sound)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
        utterance.rate = rate / 100
        synth.speak(utterance)
    }
}
