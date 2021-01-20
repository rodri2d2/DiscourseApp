//
//  TopicsDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation

protocol TopicsDataManager: class {
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
}
