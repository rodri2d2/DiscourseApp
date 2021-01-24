//
//  CategoryViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation

/**
 This procotol links the CategoryViewModel to a UI Manager Class
 
 Implement this protocol whenever a change on ViewModel Properties must also be effective for UI
 
 - Attention: Better to implement this on a ViewController Class
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol CategoryViewModelDelegate: class {
    
    ///When categories finished and are load by the system
    func didFetchCategories()
    
    /// When a problem occur during fetching categories
    /// - Parameter error: type String
    func didFailToFetchCategories(error: String)
}
