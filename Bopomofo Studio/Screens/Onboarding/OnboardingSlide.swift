//
//  OnboardingSlide.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/25/22.
//

import Foundation
import SwiftUI

struct OnboardingSlide: Equatable, Identifiable {
    let id = UUID()
    let image: String
    let title: LocalizedStringKey
    let description: LocalizedStringKey
}
