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
