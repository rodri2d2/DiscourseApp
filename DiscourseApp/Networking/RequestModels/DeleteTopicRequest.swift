//
//  DeleteTopicRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation

struct DeleteTopicResquest: APIRequest {
    
    typealias Response = DeleteTopicResponse
    
    var path: String = "/t/"
    
    var httpMethod: HTTPMethod = .delete
    
    var headers: [String : String] = [:]
    
    var body: [String : Any] = [:]
    
    var parameters: [String : String] = [:]
    
    // MARK: - Class Properties
    var id: Int
    
    init(id: Int) {
        self.id = id
        let idToRequest = String(id)
        self.path.append(idToRequest)
        self.path.append(".json")
    }
    
}
