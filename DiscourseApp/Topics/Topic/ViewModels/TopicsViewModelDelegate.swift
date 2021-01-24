//
//  TopicViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 15/1/21.
//

import Foundation


/**
 This procotol links the TopicViewModel to a UI Manager Class
 
 Implement this protocol whenever a change on ViewModel Properties must also be effective for UI
 
 - Attention: Better to implement this on a ViewController Class
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol TopicsViewDelegate: class {
    
    
    /// When topics finished and are load by the system
    func topicsFetched()
    
    
    /// When create an new topic successfully
    func didCreatedNewTopic()
    
    
    /// When a problem occur during fetching topics
    /// - Parameter error: type String
    func didFailToFetchTopics(error: String)
}
