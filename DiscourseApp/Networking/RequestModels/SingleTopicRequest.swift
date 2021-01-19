//
//  SigleTopicRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


struct SingleTopicRequest: APIRequest{
    
    
    // MARK: - APIRequest Implementations
    typealias Response = SingleTopicResponse
    
    var path: String = "/t/"
    
    var httpMethod: HTTPMethod = .get
    
    var headers: [String : String] = [:]
    
    var body: [String : Any] = [:]
    
    var parameters: [String : String] = [:]
    
    
    // MARK: - Class Properties
    var id: Int
    
    // MARK: - Lifecyle
    init(id: Int) {
        self.id = id
        let idToRequest = String(id)
        self.path.append(idToRequest)
        self.path.append(".json")
    }
}
