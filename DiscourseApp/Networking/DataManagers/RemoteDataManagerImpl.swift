//
//  RemoteDataManagerImpl.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


class RemoteDataManagerImpl: RemoteDataManager{

    

    // MARK: - Class Properties
    let networkService: NetworkService
    
    // MARK: - Lifecycle
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    
    // MARK: - RemoteDataManager Implementations
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        
        let request = LatestTopicsResquest()
        self.networkService.fetch(this: request, for: completion)
        
    }
    
    func fetchSingleTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>) -> ()) {
        
        let request = SingleTopicRequest(id: id)
        self.networkService.fetch(this: request, for: completion)
    }
    
    
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        let request = DeleteTopicResquest(id: id)
        print(request.baseURL)
        self.networkService.fetch(this: request, for: completion)
    }

    
    
}
