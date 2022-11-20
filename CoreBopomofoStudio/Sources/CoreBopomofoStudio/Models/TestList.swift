//
//  TestList.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 5/11/22.
//

import Foundation

public struct TestList {

    //MARK: - Symbol List
    public let zhuyinSymbols = ["ㄅ","ㄆ","ㄇ","ㄈ","ㄉ","ㄊ","ㄋ","ㄌ","ˇ","ㄍ","ㄎ",
                         "ㄏ","ˋ","ㄐ","ㄑ","ㄒ","ㄓ","ㄔ","ㄕ","ㄖ","ˊ","ㄗ","ㄘ","ㄙ","˙","ㄧ","ㄨ","ㄩ","ㄚ","ㄛ","ㄜ","ㄝ","ㄞ","ㄟ","ㄠ","ㄡ","ㄢ","ㄣ","ㄤ","ㄥ","ㄦ"]
    
    public let pinyinSymbols = ["b","p","m","f","d","t","n","l","ˇ","g","k",
                         "h","ˋ","j","q","x","zh","ch","sh","r","ˊ","z","c","s","˙","i","u","ü","a","o","e*","e","ai","ei","ao","ou","an","en","ang","eng","er"]
    
    //MARK: - Pronunciation List
    public let zhuyinPronunciation =
    ["b in boy",
     "p in pout",
     "m in mom",
     "f in fat",
     "d in dad",
     "t in tone",
     "n in no",
     "l in low",
     "3rd tone",
     "g in iguana",
     "k in kit",
     "h in how",
     "4th tone",
     "j in june",
     "ch in chew",
     "sh in sheesh",
     "je in jerk",
     "ch in choke",
     "sh in shot",
     "r in drought",
     "2nd tone",
     "z in zip",
     "ts in cats",
     "s in soon",
     "neutral tone",
     "i in iguana",
     "u in iguana",
     "ü in june",
     "a in fat",
     "o in go",
     "uh in duh",
     "e in yet",
     "igh in sigh",
     "ay in lay",
     "ow in cow",
     "ow in row",
     "an in iguana",
     "en in pen",
     "a + nasal sound",
     "ngue in tongue",
     "ur in fur",]
    
    public let pinyinPronunciation =
    ["ㄅ b in boy",
     "ㄆ p in pout",
     "ㄇ m in mom",
     "ㄈ f in fat",
     "ㄉ d in dad",
     "ㄊ t in tone",
     "ㄋ n in no",
     "ㄌ l in low",
     "ˇ 3rd tone",
     "ㄍ g in iguana",
     "ㄎ k in kit",
     "ㄏ h in how",
     "ˋ 4th tone",
     "ㄐ j in june",
     "ㄑ ch in chew",
     "ㄒ sh in sheesh",
     "ㄓ je in jerk",
     "ㄔ ch in choke",
     "ㄕ sh in shot",
     "ㄖ r in drought",
     "ˊ 2nd tone",
     "ㄗ z in zip",
     "ㄘ ts in cats",
     "ㄙ s in soon",
     "˙ neutral tone",
     "ㄧ i in iguana",
     "ㄨ u in iguana",
     "ㄩ ü in june",
     "ㄚ a in fat",
     "ㄛ o in go",
     "ㄜ uh in duh",
     "ㄝ e in yet",
     "ㄞ igh in sigh",
     "ㄟ ay in lay",
     "ㄠ ow in cow",
     "ㄡ ow in row",
     "ㄢ an in iguana",
     "ㄣ en in pen",
     "ㄤ a + nasal sound",
     "ㄥ ngue in tongue",
     "ㄦ ur in fur"]
    
    public let pinyinDictionary : [String:String] = ["b":"ㄅ","p":"ㄆ","m":"ㄇ","f":"ㄈ","d":"ㄉ","t":"ㄊ","n":"ㄋ","l":"ㄌ","ˇ":"ˇ","g":"ㄍ","k":"ㄎ","h":"ㄏ","ˋ":"ˋ","j":"ㄐ","q":"ㄑ","x":"ㄒ","zh":"ㄓ","ch":"ㄔ","sh":"ㄕ","r":"ㄖ","ˊ":"ˊ","z":"ㄗ","c":"ㄘ","s":"ㄙ","˙":"˙","i":"ㄧ","u":"ㄨ","ü":"ㄩ","a":"ㄚ","o":"ㄛ","e":"ㄜ","e ":"ㄝ","ai":"ㄞ","ei":"ㄟ","ao":"ㄠ","ou":"ㄡ","an":"ㄢ","en":"ㄣ","ang":"ㄤ","eng":"ㄥ","er":"ㄦ"]
}
