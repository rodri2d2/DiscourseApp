//
//  TopicDetailResponse.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation

struct SingleTopicResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case details
        case numberOfPosts = "posts_count"
    }
    
    let id:            Int
    let title:         String
    let details:       PostDetails
    let numberOfPosts: Int

    
}

struct PostDetails: Codable{
    
    enum CodingKeys: String, CodingKey {
        case isDeletable    = "can_delete"
    }
    
    let isDeletable: Bool?
    
}

