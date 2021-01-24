//
//  UserViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation

/**
 This procotol links the UserViewModel to a UI Manager Class
 
 Implement this protocol whenever a change on ViewModel Properties must also be effective for UI
 
 - Attention: Better to implement this on a ViewController Class
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol UserViewModelDelegate: class {
    
    ///When users finished and are load by the system
    func didFetchUsers()
      
    /// When an error occur during the fetch users
    /// - Parameter error: type String
    func didFailToFetchUser(error: String)
}
