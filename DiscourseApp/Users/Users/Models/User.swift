//
//  User.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation


struct User: Codable{
 
    enum CodingKeys: String, CodingKey {
        case id
        case avatar      =  "avatar_template"
        case userName    = "username"
        case name
        case canEditName = "can_edit_name"
    }
    
    let id:          Int
    let avatar:      String
    let userName:    String
    let name:        String
    let canEditName: Bool?
    
}
