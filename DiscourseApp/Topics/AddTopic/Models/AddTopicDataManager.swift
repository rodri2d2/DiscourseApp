//
//  AddTopicDataManager.swift
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
protocol AddTopicDataManager: class {
    
    
    /// Add new Topic
    /// - Parameters:
    ///   - title: type String
    ///   - raw: type String
    ///   - completion: (Result<AddNewTopicResponse?, Error>) ->()
    func didAddTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) ->())
}
