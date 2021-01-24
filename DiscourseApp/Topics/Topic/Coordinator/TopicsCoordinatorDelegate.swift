//
//  TopicsCoordinatorDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 17/1/21.
//

import Foundation

/**
 This protocol defines all possible action for a TopicViewController
 Should be implemented by a class that conforms Coordinator Protocol as part o Coodinator Pattern
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol TopicsCoordinatorDelegate: class{
    
    
    /// This fucntion describes **What to do**, when a user choose a single item, in this case a single topic from a tableView of topics
    /// - Attention: Better be called by a ViewModel class
    /// - Parameter topic: Topic
    func didSelectATopic(topic: Topic)
    
    
    /// This fucntion describes **What to do**, when a user taps in a sort of BackButton or a button designed to go another view
    /// - Attention: Better be called by a ViewModel class
    func didPressPlusButton()
}
