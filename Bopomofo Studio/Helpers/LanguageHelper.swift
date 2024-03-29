//
//  PinyinHelper.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 12/5/22.
//

import Foundation

enum LanguageHelper {
    static func convertPinyin(_ pinyin: String) -> String? {
        let dictionary = ["b":"ㄅ","p":"ㄆ","m":"ㄇ","f":"ㄈ","d":"ㄉ","t":"ㄊ","n":"ㄋ","l":"ㄌ","g":"ㄍ","k":"ㄎ","h":"ㄏ","j":"ㄐ","q":"ㄑ","x":"ㄒ","zh":"ㄓ","ch":"ㄔ","sh":"ㄕ","r":"ㄖ","z":"ㄗ","c":"ㄘ","s":"ㄙ","i":"ㄧ","u":"ㄨ","uu":"ㄩ","a":"ㄚ","o":"ㄛ","eh":"ㄜ","e":"ㄝ","ai":"ㄞ","ei":"ㄟ","ao":"ㄠ","ou":"ㄡ","an":"ㄢ","en":"ㄣ","ang":"ㄤ","eng":"ㄥ","er":"ㄦ"]
        return dictionary[pinyin]
    }
    
    static func isZhuyinOrPinyin(_ character: String) -> Bool {
        let dictionary = ["b":"ㄅ","p":"ㄆ","m":"ㄇ","f":"ㄈ","d":"ㄉ","t":"ㄊ","n":"ㄋ","l":"ㄌ","g":"ㄍ","k":"ㄎ","h":"ㄏ","j":"ㄐ","q":"ㄑ","x":"ㄒ","zh":"ㄓ","ch":"ㄔ","sh":"ㄕ","r":"ㄖ","z":"ㄗ","c":"ㄘ","s":"ㄙ","i":"ㄧ","u":"ㄨ","uu":"ㄩ","a":"ㄚ","o":"ㄛ","eh":"ㄜ","e":"ㄝ","ai":"ㄞ","ei":"ㄟ","ao":"ㄠ","ou":"ㄡ","an":"ㄢ","en":"ㄣ","ang":"ㄤ","eng":"ㄥ","er":"ㄦ"]
        let zhuyin = dictionary.values
        let pinyin = dictionary.keys
        return zhuyin.contains(character) || pinyin.contains(character)
    }
    
}
