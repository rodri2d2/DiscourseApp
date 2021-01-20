//
//  AddTopicDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


protocol AddTopicDataManager: class {
    func didAddTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) ->())
}
