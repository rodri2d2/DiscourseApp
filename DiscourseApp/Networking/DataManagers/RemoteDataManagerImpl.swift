//
//  RemoteDataManagerImpl.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


class RemoteDataManagerImpl: RemoteDataManager{
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        
        let request = LatestTopicsResquest()
        self.networkService.fetch(this: request, for: completion)
        
    }
    
    
}
