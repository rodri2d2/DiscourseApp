//
//  CategoryResponse.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


struct CategoryResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case categoryList =  "category_list"
    }
    
    let categoryList: CategoryList?
}


struct CategoryList: Codable {
    let categories: [Category]
}

