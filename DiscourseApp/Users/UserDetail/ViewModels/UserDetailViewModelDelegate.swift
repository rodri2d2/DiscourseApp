//
//  UserDetailViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 23/1/21.
//

import Foundation

/**
 This procotol links the UserDetailViewModel to a UI Manager Class
 
 Implement this protocol whenever a change on ViewModel Properties must also be effective for UI
 
 - Attention: Better to implement this on a ViewController Class
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol UserDetailViewModelDelegate: class{
    
    /// When a siongle finished and are load by the system
    func didLoadUser()
    
    
    /// When update user successfully
    func didUpdateUser()
    
    
    /// When an error occur during the user update
    /// - Parameter error: type String
    func didFailToUpdateUser(error: String)
    
    
    /// When an erro occur loading a single user
    /// - Parameter error: type String
    func didFailToLoadUser(error: String)
}
