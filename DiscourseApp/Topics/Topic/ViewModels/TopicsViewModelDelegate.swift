//
//  TopicViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 15/1/21.
//

import Foundation


/**
 This procotol links the TopicViewModel to a UI Manager Class
 
 */
protocol TopicsViewDelegate: class {
    func topicsFetched()
    func didCreatedNewTopic()
    func didFailToFetchTopics(error: String)
}
