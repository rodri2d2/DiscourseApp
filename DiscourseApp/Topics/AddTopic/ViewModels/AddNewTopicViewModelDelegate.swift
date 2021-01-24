//
//  AddNewTopicViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 20/1/21.
//

import Foundation

/**
 This procotol links the AddNewTopicViewModel to a UI Manager Class
 
 Implement this protocol whenever a change on ViewModel Properties must also be effective for UI
 
 - Attention: Better to implement this on a ViewController Class
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol AddNewTopicViewModelDelegate {

    /// When create a new topic successfully
    func didCreateNewTopic()
    
    
    /// When for some reason a topic could not be created
    /// - Parameter error: type String
    func didFailToCreateTopic(error: String)
}
