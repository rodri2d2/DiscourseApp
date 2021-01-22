//
//  UserListResponse.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation

struct UserListResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
    }
    
    let directoryItems: [DirectoryItems]


}


struct DirectoryItems: Codable {
  
    let id:             Int
    let user: User
}


