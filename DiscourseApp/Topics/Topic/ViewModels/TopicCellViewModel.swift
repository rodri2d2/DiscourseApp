//
//  CellViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation

class TopicCellViewModel{
    
    let topic: Topic
    let topicTitle: String?
    var createdAt:  String?
    
    init(with topic: Topic) {
        self.topic = topic
        self.topicTitle = topic.title
        self.clearDate(createDate: topic.createdAt)
    }
    
    private func clearDate(createDate: String?){
        
        var stringDate: String
        if let index = (createDate!.range(of: "T")?.lowerBound){
            stringDate = String(createDate?.prefix(upTo: index) ?? "Creation date not available")
            self.createdAt = stringDate
        }
    }
}
