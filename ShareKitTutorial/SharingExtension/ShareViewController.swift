//
//  ShareViewController.swift
//  SharingExtension
//
//  Created by Michael Abadi Santoso on 1/28/20.
//  Copyright © 2020 Michael Abadi Santoso. All rights reserved.
//

import UIKit
import StorageKitTutorial
import NetworkKitTutorial
import SwiftUI

/// Mocking Request class for the networking call
final class Request: NetworkBaseRequest {
    var params: [String : Any]? = nil
    
    var endpoint: String {
        return "v1/api/request"
    }
}

/// Share Extention main view
final class ShareViewController: UIViewController {

    private let storage = StorageKit(type: .sharing)
    private let network = NetworkKit()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupToken()
    }
    
    /// Initialize the token from the main app and the extention take the token from main app
    private func setupToken() {
        if let token = storage.loadToken() as? String {
            network.setupAuthentification(withToken: token)
            print("TOKEN : \(token)")
            let alert = UIAlertController(title: "Loaded", message: "Token succesfully loaded : \(token)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBSegueAction func addView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ShareContentView())
    }
    
}
