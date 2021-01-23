//
//  UserListRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation


struct UserListRequest: APIRequest {
        
    // MARK: - APIRsquest Protocol Implementations
    typealias Response = UserListResponse
    
    var path: String = "/directory_items.json"
    
    var httpMethod: HTTPMethod = .get
    
    var headers: [String : String] = ["Accept": "application/json"]
    
    var body: [String : Any] = [:]
    
    var parameters: [String : String] = [:]
    
    
    init( ){
        setParameters()
        
    }
    
    private mutating func setParameters(){
        parameters["period"] = "weekly"
        parameters["order"]  = "topic_count"
        parameters["asc"]    = "true"
        parameters["page"]   = "1"
        
    }
    
}
