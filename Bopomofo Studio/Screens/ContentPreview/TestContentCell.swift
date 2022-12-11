//
//  TestContentCell.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import SwiftUI

struct TestContentCell: View {
    let image: String
    @Binding var showPronunciation: Bool
    let zhuyin: String
    let pinyin: String
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 0) {
                if LanguageHelper.isZhuyinOrPinyin(image) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 80, maxHeight: 80)
                        .cornerRadius(16)
                        .padding(5)
                } else if image == "\"\"" {
                    Text("Coming Soon!")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .cornerRadius(16)
                        .padding(5)
                        .multilineTextAlignment(.center)
                } else {
                    Text(image)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .frame(maxWidth: 80, maxHeight: 80)
                        .cornerRadius(16)
                        .padding(5)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.secondary, lineWidth: 1)
            }
            .padding(10)
            if showPronunciation && zhuyin != " " && pinyin != " " {
                VStack(alignment: .leading) {
                    Text(zhuyin)
                    Text(pinyin)
                }
                .font(.headline)
            }
        }
        .frame(maxWidth: showPronunciation ? 400 : nil, minHeight: 100, alignment: .leading)
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
                image: "BPMF",
                showPronunciation: .constant(true),
                zhuyin: "Zhuyin",
                pinyin: "Pinyin"
            )
            
            TestContentCell(
                image: "BPMF",
                showPronunciation: .constant(false),
                zhuyin: "Zhuyin",
                pinyin: "Pinyin"
            )
        }
    }
}
