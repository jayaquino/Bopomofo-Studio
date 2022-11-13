//
//  AnalyticsProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation

public protocol AnalyticsProvider {
    associatedtype AnalyticEvent
    
    func track(event: AnalyticEvent)
}

public protocol AnalyticTrackingProtocol {
    var eventName: String { get }
    var parameters: [String: String] { get }
}
