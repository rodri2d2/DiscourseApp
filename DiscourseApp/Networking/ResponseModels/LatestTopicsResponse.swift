//
//  LatestTopicsResponse.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation

struct LatestTopicsResponse: Codable {
        
    enum CodingKeys: String, CodingKey {
        case topicList = "topic_list"
    }
    
    let topicList: TopicList?
}


struct TopicList: Codable {
    let topics: [Topic]
}
