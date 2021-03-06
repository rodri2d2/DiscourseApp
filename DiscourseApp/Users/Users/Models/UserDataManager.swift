//
//  UserDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import UIKit
/**
 This protocol manages Users Data
 */
protocol UserDataManager: class {
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>)->())
    func fetchUserImage(imageURL: String, completion: @escaping (_ image: UIImage)->())
}
