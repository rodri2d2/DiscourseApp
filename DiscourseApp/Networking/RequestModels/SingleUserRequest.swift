//
//  SingleUserReques.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation


struct SingleUserRequest: APIRequest {
    
    
    // MARK: - Class properties
    let userName: String
    
    // MARK: - APIRsquest Protocol Implementations
    typealias Response = SingleUserResponse
    
    var path: String = "/users/"
    
    var httpMethod: HTTPMethod = .get
    
    var headers: [String : String] = [:]
    
    var body: [String : Any] = [:]
    
    var parameters: [String : String] = [:]
    
    init(userName: String) {
        self.userName = userName
        self.path.append("\(self.userName).json")
    
    }
    
}
