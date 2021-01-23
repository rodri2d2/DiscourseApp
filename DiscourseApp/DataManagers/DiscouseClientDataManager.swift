//
//  DiscouseClientDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import UIKit



class DiscourseClientDataManager {
    
    let remoteManager: RemoteDataManager
    
    init(manager: RemoteDataManager) {
        self.remoteManager = manager
    }
}

// MARK: - TOPICS RELATED EXTENSIONS
extension DiscourseClientDataManager: TopicsDataManager{
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        remoteManager.fetchAllTopics(completion: completion)
    }
}

extension DiscourseClientDataManager: TopicDetailManager{

    func fetchTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>) -> ()) {
        remoteManager.fetchSingleTopic(id: id, completion: completion)
    }
    
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        remoteManager.deleteTopic(id: id, completion: completion)
    }
    
}

extension DiscourseClientDataManager: AddTopicDataManager{
    func didAddTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ()) {
        remoteManager.addNewTopic(title: title, raw: raw, completion: completion)
    }
}


// MARK: - CATEGORY RELATED EXTENSIONS
extension DiscourseClientDataManager: CategoryDataManager {
    func fetchCategories(completion: @escaping (Result<CategoryResponse?, Error>) -> ()) {
        remoteManager.fetchCategories(completion: completion)
    }
}

// MARK: - USERS RELATED EXTENSIONS
extension DiscourseClientDataManager: UserDataManager, UserDetailDataManager{

    
    func fetchUserImage(imageURL: String, completion: @escaping (UIImage) -> ()) {
        remoteManager.fetchUserImage(imageURL: imageURL, completion: completion)
    }
    
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>) -> ()) {
        remoteManager.fetchUsers(completion: completion)
    }
    
    func fetchUser(userName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        remoteManager.fetchSingleUser(userName: userName, completion: completion)
    }
    
    func updateUser(user: String, newName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        remoteManager.updateUser(userName: user, newName: newName, completion: completion)

    }
}
