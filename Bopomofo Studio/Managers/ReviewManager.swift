//
//  ReviewManager.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 7/24/22.
//

import Foundation

import Foundation
import StoreKit

final class ReviewManager {
    
    static let shared = ReviewManager()
    
    private var shouldPresent = false
    private let sessionsCompletedChecks = [3, 6, 20]
    private var sessionsCompleted = UserDefaults.standard.integer(forKey: "sessionsCompleted") {
        didSet {
            if sessionsCompletedChecks.contains(oldValue) {
                shouldPresent = true
            }
        }
    }
    
    func updateSessionsCompleted() {
        print(sessionsCompleted)
        sessionsCompleted += 1
        UserDefaults.standard.set(sessionsCompleted, forKey: "sessionsCompleted")
        showReviewAlertIfAppropriate()
    }
    
    private func showReviewAlertIfAppropriate() {
        if shouldPresent {
            shouldPresent = false
            requestReview()
        }
    }
    
    private func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if #available(iOS 14.0, *) {
                SKStoreReviewController.requestReview(in: scene)
            } else {
                SKStoreReviewController.requestReview()
            }
        }
    }
}
