//
//  Strings+Extension.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/5/22.
//

import Foundation

extension String {
    var containsChineseCharacters: Bool {
        return self.range(of: "\\p{Han}", options: .regularExpression) != nil
    }
}
