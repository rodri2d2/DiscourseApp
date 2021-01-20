//
//  UIViewController+Ext.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 20/1/21.
//

import UIKit
extension UIViewController {
    
    
    /// Show a basic AlertController(Ok Opition)
    /// - Parameters:
    ///   - alertMessage: Alert Message
    ///   - alertTitle: Alert Title
    ///   - alertActionTitle: Action Title
    func showAlert(_ alertMessage: String,
                               _ alertTitle: String = NSLocalizedString("Error", comment: ""),
                               _ alertActionTitle: String = NSLocalizedString("OK", comment: "")) {

        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
