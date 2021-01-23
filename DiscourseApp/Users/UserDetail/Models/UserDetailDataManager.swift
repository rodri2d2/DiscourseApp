//
//  UserDetailDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation

protocol UserDetailDataManager: class {
    
    func fetchUser(userName: String, completion: @escaping (Result<SingleUserResponse?, Error>)->())
    func updateUser(user: String, newName: String, completion: @escaping (Result<SingleUserResponse?,Error>)->())
    
}
