//
//  StorageKit.swift
//  StorageKitTutorial
//
//  Created by Michael Abadi Santoso on 1/27/20.
//  Copyright © 2020 Michael Abadi Santoso. All rights reserved.
//

import Foundation

public let appGroupIdentifier = "group.com.michaelabadi.ShareKitTutorial.container"

/// StorageKit task is loading and saving any kind of token authentification
public class StorageKit {
    
    public enum StorageType {
        case `default`
        case sharing
    }
    
    private let type: StorageType
    
    public init(type: StorageType) {
        self.type = type
    }
    
    /// Function for saving the token.
    /// - Parameter token: the existing token.
    public func saveToken(_ token: String) {
        getUserDefault()?.set(token, forKey: "token")
    }
    
    /// Function for loading the token.
    public func loadToken() -> Any? {
        return getUserDefault()?.value(forKey: "token")
    }
    
    /// Function for delete the existing token.
    public func deleteToken() {
        getUserDefault()?.removeObject(forKey: "token")
    }
    
    private func getUserDefault() -> UserDefaults? {
        switch type {
        case .default:
            return UserDefaults.standard
        case .sharing:
            return UserDefaults(suiteName: appGroupIdentifier)
        }
    }
    
}
