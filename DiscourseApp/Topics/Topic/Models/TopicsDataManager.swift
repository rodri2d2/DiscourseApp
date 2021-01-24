//
//  TopicsDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation

/**
 This protocol manages Topic Data
 */
protocol TopicsDataManager: class {
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
}
