//
//  EnvironmentKeys.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/13/22.
//

import Foundation
import CoreBopomofoStudio

public enum EnvironmentKeys {
    enum Keys {
        static let environment = "ENVIRONMENT"
        static let mixpanelKey = "MIXPANEL_KEY"
    }
    
    /// Get plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    /// Get keys from plist
    static let environment: AppEnvironment = {
        guard let environment = AppEnvironment(rawValue: EnvironmentKeys.infoDictionary[Keys.environment] as? String ?? "") else {
            fatalError("Environment not set in plist")
        }
        return environment
    }()
    
    static let mixpanelKey: String = {
        guard let oneSignalIdString = EnvironmentKeys.infoDictionary[Keys.mixpanelKey] as? String else {
            fatalError("Mixpanel Key not set in plist")
        }
        return oneSignalIdString
    }()
}
