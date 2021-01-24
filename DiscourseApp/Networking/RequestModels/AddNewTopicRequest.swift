//
//  AddNewTopicRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 20/1/21.
//

import Foundation

struct AddNewTopicRequest: APIRequest {
    
    
    // MARK: - APIRsquest Protocol Implementations
    typealias Response = AddNewTopicResponse
    var path: String = "/posts"
    var httpMethod: HTTPMethod          = .post
    var headers: [String : String]      = [:]
    var body: [String : Any]            = [:]
    var parameters: [String : String]   = [:]
    
    
    // MARK: - Class Properties
    let title: String
    let raw:   String
    
    init(title: String, raw: String) {
        
        self.title = title
        self.raw   = raw
        self.setBody()
        
    }
    
    
    private mutating func setBody(){
        
        self.body["title"] = self.title
        self.body["raw"] =   self.raw
        
    }
    
    
    
    
    
    

    
    
}
