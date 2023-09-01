//
//  UserDefaults+Extensions.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/26/22.
//

import Foundation

extension UserDefaults {
    static var didSeeOnboarding: Bool {
        get {
            standard.bool(forKey: "didSeeOnboarding")
        }

        set {
            standard.set(newValue, forKey: "didSeeOnboarding")
        }
    }
    
    static var characterSet: String {
        get {
            standard.string(forKey: "characterSet") ?? "simplified"
        }

        set {
            standard.set(newValue, forKey: "characterSet")
        }
    }
    
    static var voiceSelection: String {
        get {
            standard.string(forKey: "voiceSelection") ?? "female"
        }

        set {
            standard.set(newValue, forKey: "voiceSelection")
        }
    }
    
    
    static var pronunciationTextMode: Bool {
        get {
            standard.bool(forKey: "pronunciationTextMode")
        }

        set {
            standard.set(newValue, forKey: "pronunciationTextMode")
        }
    }
    
    
    static var pronunciationVoiceMode: Bool {
        get {
            standard.bool(forKey: "pronunciationVoiceMode")
        }

        set {
            standard.set(newValue, forKey: "pronunciationVoiceMode")
        }
    }
    
    
    static var translationMode: Bool {
        get {
            standard.bool(forKey: "translationMode")
        }

        set {
            standard.set(newValue, forKey: "translationMode")
        }
    }
    
    static var speakingSpeed: Float {
        get {
            standard.float(forKey: "speakingSpeed")
        }

        set {
            standard.set(newValue, forKey: "speakingSpeed")
        }
    }
    
    static var timerValue: Double {
        get {
            standard.double(forKey: "timerValue")
        }

        set {
            standard.set(newValue, forKey: "timerValue")
        }
    }
    
    static var didPlayASoundAtLeastOnce: Bool {
        get {
            standard.bool(forKey: "didPlayASoundAtLeastOnce")
        }

        set {
            standard.set(newValue, forKey: "didPlayASoundAtLeastOnce")
        }
    }

}
