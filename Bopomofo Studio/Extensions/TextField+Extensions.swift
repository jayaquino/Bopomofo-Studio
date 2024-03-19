//
//  TextField+Extensions.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/6/22.
//

import Foundation
import SwiftUI

public extension UITextField {
    override var textInputMode: UITextInputMode? {
        return UITextInputMode.activeInputModes.filter { $0.primaryLanguage == "zh-Hant" }.first ?? super.textInputMode
    }
}

public extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}
