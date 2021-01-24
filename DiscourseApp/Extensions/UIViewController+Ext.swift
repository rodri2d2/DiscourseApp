//
//  UIViewController+Ext.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 20/1/21.
//

import UIKit
extension UIViewController {
    

    /**
     Show a basic AlertController(Ok Opition)
     - Parameters:
        - alertMessage: Alert Message
        - alertTitle: Alert Title
        - alertActionTitle: Action Title
     
     This extension helps to implement a Alert much faster
     
     ## Example
     
     Being at some ViewController or a Class that has a implementation of UIViewController, call this method
     ~~~
     class ViewController: UIViewController {
         override func viewDidLoad() {
            super.viewDidLoad()
            
            self.showAlert("This is the Alert message", "This is Alert Title", "Alert Button Text")
     
         }
     }
     ~~~
     - Attention: This class was first created by Roberto Garrido. At the time this project was created he teach me how to user this type of class to improve my habilities with networking. **Thank you very much Roberto Garrido**
     - Author: Roberto Garrido
     - Version: v1.0

     */
    func showAlert(_ alertMessage: String,
                               _ alertTitle: String = NSLocalizedString("Error", comment: ""),
                               _ alertActionTitle: String = NSLocalizedString("OK", comment: "")) {

        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
