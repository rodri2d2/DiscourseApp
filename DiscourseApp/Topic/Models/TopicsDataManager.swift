//
//  TopicDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation

struct TopicsDataManager {
    
    func fetchLatestTopics() -> [Topic]? {
        let topic = [
            Topic(id: 1,    title: "Topic 1"),
            Topic(id: 2,    title: "Topic 2"),
            Topic(id: 3,    title: "Topic 3"),
            Topic(id: 4,    title: "Topic 4"),
            Topic(id: 5,    title: "Topic 5"),
            Topic(id: 6,    title: "Topic 6"),
            Topic(id: 7,    title: "Topic 7"),
            Topic(id: 8,    title: "Topic 8"),
            Topic(id: 9,    title: "Topic 9"),
            Topic(id: 10,   title: "Topic 10"),
            Topic(id: 11,   title: "Topic 11"),
            Topic(id: 12,   title: "Topic 12")
        ]
        return topic
    }
    
}
