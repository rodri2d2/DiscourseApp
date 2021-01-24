//
//  TopicDetailCoodinatorDelgate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation

/**
 This protocol defines all possible action for a TopicViewController
 Should be implemented by a class that conforms Coordinator Protocol as part o Coodinator Pattern
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol TopicDetailCoodinatorDelegate: class{
    
    
    /// This fucntion describes **What to do**, when a user taps in a sort of BackButton or a button designed to go another view. Its
    /// - Attention: Better be called by a ViewModel class. Its part of **Topic Detail Flow**
    func didPressBackButton()
}
