//
//  RemoteDataManagerProtocol.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation

protocol RemoteDataManager {
    
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
    func fetchSingleTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>)->())
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ())
    func addNewTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ())
}
