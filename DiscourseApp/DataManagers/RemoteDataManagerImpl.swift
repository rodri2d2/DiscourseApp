//
//  RemoteDataManagerImpl.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import UIKit


class RemoteDataManagerImpl: RemoteDataManager{
    
    // MARK: - Class Properties
    let networkService: NetworkService
    
    // MARK: - Lifecycle
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - TOPICS RELATED IMPLEMENTATION
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
        self.networkService.fetch(this: request, for: completion)
    }
    
    func addNewTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ()) {
        let request = AddNewTopicRequest(title: title, raw: raw)
        self.networkService.fetch(this: request, for: completion)
    }
    
    // MARK: - CATEGORY RELATED IMPLEMENTATION
    func fetchCategories(completion: @escaping (Result<CategoryResponse?, Error>) -> ()) {
        let request = CategoryRequest()
        self.networkService.fetch(this: request, for: completion)
    }
    
    // MARK: - USERS RELATED IMPLEMENTATION
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>) -> ()) {
        let resquest = UserListRequest()
        self.networkService.fetch(this: resquest, for: completion)
    }
    
    func fetchUserImage(imageURL: String, completion: @escaping (UIImage) -> ()) {
        let  request = UserImageRequest(imageURL: imageURL)
        guard let url = request.request().url else {return}
        
        self.networkService.fetchImage(imageURL: url, completion: completion)
    }
    
    func fetchSingleUser(userName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        
        let request = SingleUserRequest(userName: userName)
        self.networkService.fetch(this: request, for: completion)
    }
    
    func updateUser(userName: String, newName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        let request = UpdataSingleUserRequest(userName: userName, newName: newName)
        self.networkService.fetch(this: request, for: completion
        )
    }
    
}
