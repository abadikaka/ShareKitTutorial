//
//  SelectorEngine.swift
//  SelectorUIViewKitTutorial
//
//  Created by Michael Abadi Santoso on 1/27/20.
//  Copyright © 2020 Michael Abadi Santoso. All rights reserved.
//

import Foundation
import SwiftUI

/// User model
public struct User: Identifiable, Codable {
    public let id: String
    public let name: String
    public let job: String
    
    public init(id: String, name: String, job: String) {
        self.id = id
        self.name = name
        self.job = job
    }
}

/// Class to represent the engine of this framework.
public class SelectorEngine {
    
    public init() {}
    
    /// Presenting a selector view method.
    /// - Parameters:
    ///   - user: the user model.
    ///   - viewController: the source view controller to present the selector view.
    public func presentSelectorView(withUsers user: [User], from viewController: UIViewController) {
        let contentView = BaseView(user: user)
        let contentViewController = UIHostingController(rootView: contentView)
        let contentNavigationController = UINavigationController(rootViewController: contentViewController)
        viewController.present(contentNavigationController, animated: true, completion: nil)
    }
    
    /// Retrieving the base view of the selector view.
    /// - Parameter user: the user model.
    public func getSelectorView(withUsers user: [User]) -> BaseView {
        return BaseView(user: user)
    }
}
