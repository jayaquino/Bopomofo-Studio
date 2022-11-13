//
//  AnalyticsProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation

public protocol AnalyticsProvider {
    
}

enum AnalyticsProviderConfig {
    case mixpanel
    case mock
        
    var provider: AnalyticsProvider {
        switch self {
        case .analyticsProvider:
            return MixPanelAnalyticsProvider()
        case .mockAnalyticsProvider:
            return MockAnalyticsProvider()
        }
    }
}
