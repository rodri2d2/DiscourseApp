//
//  AddNewTopicViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 20/1/21.
//

import Foundation
protocol AddNewTopicViewModelDelegate {
    func didCreateNewTopic()
    func didFailToCreateTopic(error: String)
}
