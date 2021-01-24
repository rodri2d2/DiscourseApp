//
//  CategoryRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation


struct CategoryRequest: APIRequest {
    
    typealias Response = CategoryResponse
    
    var path: String = "/categories.json"
    
    var httpMethod: HTTPMethod = .get
    
    var headers: [String : String]    = [:]
     
    var body: [String : Any]          = [:]
    
    var parameters: [String : String] = [:]
    
}
