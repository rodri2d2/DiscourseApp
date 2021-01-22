//
//  CellViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation

class TopicCellViewModel{
    
    var topic: Topic
    var topicTitle: String?
    
    init(with topic: Topic) {
        self.topic = topic
        self.topicTitle = topic.title
    }
}
