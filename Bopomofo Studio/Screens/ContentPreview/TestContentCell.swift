//
//  TestContentCell.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import SwiftUI

struct TestContentCell: View {
    @Binding var showPronunciation: Bool
    @Binding var showTranslation: Bool
    
    let image: String
    let zhuyin: String
    let pinyin: String
    let translation: String
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                if LanguageHelper.isZhuyinOrPinyin(image) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                } else if image == " " {
                    Text("Coming Soon!")
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                } else {
                    Text(image)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding()
                }
            }
            .frame(maxWidth: 120, maxHeight: .infinity, alignment: .center)
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.secondary, lineWidth: 1)
            }
            .padding(10)
            
            if ((showPronunciation && zhuyin != " " && pinyin != " ") || (showTranslation && translation != " ")) && image != " " {
                VStack(alignment: .leading) {
                    if showPronunciation {
                        VStack(alignment: .leading) {
                            Text(zhuyin)
                            
                            if zhuyin != pinyin {
                                Text(pinyin)
                            }
                        }
                    }
                    if showTranslation {
                        Text(translation)
                            .lineLimit(2)
                    }
                }
                .padding(.vertical, 10)
                .padding(.trailing, 10)
                .lineLimit(1)
                .minimumScaleFactor(0.2)
                .font(.headline)
            }
        }
        .frame(
            maxWidth: ((showPronunciation && zhuyin != " " && pinyin != " ") || (showTranslation && translation != " ")) ? 400 : nil,
            maxHeight: 120, alignment: .leading
        )
        .cornerRadius(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(
                    color: .black.opacity(0.25),
                    radius: 7,
                    x: 0,
                    y: 2
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.secondary, lineWidth: 1)
                )
        )
        .padding(.horizontal, 25)
    }
}

struct TestContentCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestContentCell(
                showPronunciation: .constant(true),
                showTranslation: .constant(true),
                image: "時光飛逝",
                zhuyin: "Zhuyin with a very long description",
                pinyin: "Pinyin with a very long description",
                translation: "Translation with a very long description"
            )
            
            TestContentCell(
                showPronunciation: .constant(false),
                showTranslation: .constant(true),
                image: "BPMF",
                zhuyin: "Zhuyin",
                pinyin: "Pinyin",
                translation: "None"
            )
        }
    }
}
