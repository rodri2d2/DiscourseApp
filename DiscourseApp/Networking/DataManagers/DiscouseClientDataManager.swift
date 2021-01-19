//
//  DiscouseClientDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation



class DiscourseClientDataManager {
    
    let remoteManager: RemoteDataManager
    
    init(manager: RemoteDataManager) {
        self.remoteManager = manager
    }
}


extension DiscourseClientDataManager: TopicsDataManager{
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        remoteManager.fetchAllTopics(completion: completion)
    }
}
