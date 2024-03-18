//
//  TestContentCell.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import SwiftUI
import SwiftData
import CoreBopomofoStudio

struct TestContentCell: View {
    @Environment(\.modelContext) private var context
    @Query private var vocabulary: [VocabularyModel]
    
    let vocabularyModel: VocabularyModel
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
            .frame(maxHeight: .infinity, alignment: .leading)
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.secondary, lineWidth: 1)
            }
            .padding(10)
                   
            Spacer()
            
            VStack(alignment: .trailing) {
                Button {
                    if vocabulary.compactMap({ $0.translation }).contains(translation) {
                        removeVocabularyToSwiftData(vocabularyModel)
                    } else {
                        addVocabularyToSwiftData(vocabularyModel)
                    }
                } label: {
                    Group {
                        if vocabulary.compactMap({ $0.translation }).contains(translation) {
                            Text("Remove")
                                .foregroundStyle(Color.white)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: .infinity)
                                        .fill(Color.red)
                                )
                        } else {
                            Text("Add")
                                .foregroundStyle(Color.white)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: .infinity)
                                        .fill(Color.blue)
                                    )
                        }
                    }
                }
                .font(.footnote)


                if ((showPronunciation && zhuyin != " " && pinyin != " ") || (showTranslation && translation != " ")) && image != " " {
                    
                    VStack(alignment: .trailing) {
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
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                    .font(.headline)
                }
            }
            .padding(16)
        }
        .frame(maxHeight: 120)
        .frame(maxWidth: (((showPronunciation && zhuyin != " " && pinyin != " ") || (showTranslation && translation != " ")) && image != " ") ? .infinity : nil)
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
    
    private func addVocabularyToSwiftData(_ vocabulary: VocabularyModel) {
        context.insert(vocabulary)
    }
    
    private func removeVocabularyToSwiftData(_ vocabulary: VocabularyModel) {
        context.delete(vocabulary)
    }
}

struct TestContentCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestContentCell(
                vocabularyModel: .init(characterSet: [:], pronunciationSet: [:], translation: ""),
                showPronunciation: .constant(true),
                showTranslation: .constant(true),
                image: "時光飛逝",
                zhuyin: "Zhuyin with a very long description",
                pinyin: "Pinyin with a very long description",
                translation: "Translation with a very long description"
            )
            
            TestContentCell(
                vocabularyModel: .init(characterSet: [:], pronunciationSet: [:], translation: ""),
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
