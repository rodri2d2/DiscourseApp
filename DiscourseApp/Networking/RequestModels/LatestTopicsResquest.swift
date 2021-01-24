//
//  LatestTopicsResquest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation


struct LatestTopicsResquest: APIRequest  {
    
    typealias Response                = LatestTopicsResponse
    
    var path: String                  = "/latest"
    
    var httpMethod: HTTPMethod        = .get
    
    var headers: [String : String]    = ["Accept": "application/json"]
    
    var body: [String : Any]          = [:]
    
    var parameters: [String : String] = [:]
    
}
