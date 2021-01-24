//
//  TopicDetailManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation

/**
 This protocol manages TopicDetail Data
 
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
protocol TopicDetailManager: class {
    
    
    /// Fetch single Topic
    /// - Parameters:
    ///   - id: type Int
    ///   - completion: type (Result<SingleTopicResponse?, Error>) -> ()
    func fetchTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>) -> ())
    
    
    /// Delete single Topic
    /// - Parameters:
    ///   - id: type Int
    ///   - completion: type (Result<DeleteTopicResponse?, Error>) -> ()
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ())
}
