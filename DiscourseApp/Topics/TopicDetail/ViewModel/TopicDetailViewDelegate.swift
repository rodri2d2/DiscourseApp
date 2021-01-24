//
//  TopicsDetailViewDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation

/**
 This protocol relates a ViewController with a ViewModel.
 
 Implement this protocol whenever a change on ViewModel Properties must also be effective for UI
 
 - Attention: Better to implement this on a ViewController Class
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol TopicDetailViewDelegate: class {
    
    /// When a Topic was fetched. Source independent(Remote or Local)
    func didFetchTopic()
    
    /// When a Topic was deleted. Source independent(Remote or Local)
    func didDeleteTopic()
    
    
    /// When a **Error** during the call occur.
    /// - Parameter error: type String
    func didFailToFetchTopic(error: String)
}
