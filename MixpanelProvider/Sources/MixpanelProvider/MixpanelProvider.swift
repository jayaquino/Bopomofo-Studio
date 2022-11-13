//
//  MixpanelProvider.swift
//  
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation
import CoreBopomofoStudio
import Mixpanel

public class MixpanelProvider: AnalyticsProvider {
    let environment: AppEnvironment
    
    public init(
        key: String,
        environment: AppEnvironment
    ) {
        Mixpanel.initialize(
            token: key,
            trackAutomaticEvents: true,
            flushInterval: 3
        )
        self.environment = environment
        super.init()
        print("environment is: \(environment)")
    }
    
    private var mixpanelInstance: MixpanelInstance {
        Mixpanel.mainInstance()
    }
    
    override public func track(event: AnalyticEvent) {
        Task {
            mixpanelInstance.track(
                event: event.eventName,
                properties: event.parameters
            )
        }
        if environment == .STAGING {
            print("📊\nTracking \n\(event.eventName) \n\(event.parameters)")
        }
    }
}
