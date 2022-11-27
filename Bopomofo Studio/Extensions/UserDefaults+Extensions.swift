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
}
