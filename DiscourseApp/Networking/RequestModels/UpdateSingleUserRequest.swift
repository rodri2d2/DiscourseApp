//
//  UpdateSingleUserRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation


struct UpdataSingleUserRequest: APIRequest {
    
    typealias Response = SingleUserResponse
    
    var path: String = "/users/"
    
    var httpMethod: HTTPMethod = .put
    
    var headers: [String : String] =     [:]
    
    var body: [String : Any] =           [:]
    
    var parameters: [String : String] =  [:]
    
    init(userName: String, newName: String){
        self.path.append(userName)
        self.body["name"] = newName
    }
    
    
}
