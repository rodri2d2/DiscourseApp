//
//  RemoteDataManagerProtocol.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import UIKit

protocol RemoteDataManager {
    
    // MARK: - Topics Related
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
    func fetchSingleTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>)->())
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ())
    func addNewTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ())
    
    // MARK: - Categories Related
    func fetchCategories(completion: @escaping (Result<CategoryResponse?, Error>) -> ())
    
    
    // MARK: - Users Related
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>)->())
    func fetchUserImage(imageURL: String, completion: @escaping (_ image: UIImage)->())
}
