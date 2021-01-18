//
//  CellViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation

class CellViewModel {
    
    var topic: Topic
    var topicTextLabel: String?
    
    init(topic: Topic) {
        self.topic = topic
        self.topicTextLabel = topic.title
    }
}
