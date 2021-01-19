//
//  TopicsDetailViewDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


protocol TopicDetailViewDelegate: class {
    func didFetchTopic()
    func didDeleteTopic()
}
