//
//  TestContentCell.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import SwiftUI

struct TestContentCell: View {
    let image: String
    let description: String
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 80, maxHeight: 80)
                    .cornerRadius(16)
                    .padding(5)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.secondary, lineWidth: 1)
            }
            .padding(10)
            Text(description)
        }
        .frame(maxWidth: 340, minHeight: 100, alignment: .leading)
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
        TestContentCell(
            image: "BPMF",
            description: "This is a description"
        )
    }
}
