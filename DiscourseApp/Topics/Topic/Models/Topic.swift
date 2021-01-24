//
//  Topic.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation

struct Topic: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case createdAt = "created_at"
    }
    
    let id:         Int
    let title:      String
    let createdAt:  String?
}
