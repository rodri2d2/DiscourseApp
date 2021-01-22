//
//  ImageRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import UIKit


struct UserImageRequest: APIRequest {
    
    typealias Response = UserImageResponse
    
    var path: String = ""
    
    var httpMethod: HTTPMethod = .get
    
    var headers: [String : String] = [:]
    
    var body: [String : Any] = [:]
    
    var parameters: [String : String] = [:]
    

    init(imageURL: String) {
        self.path.append(imageURL)
    }
    
   
    
    
}
