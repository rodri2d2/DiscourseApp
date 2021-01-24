//
//  CartegoryDataManager.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation

/**
 This protocol manages Category Data
 */
protocol CategoryDataManager: class {
    
    func fetchCategories(completion: @escaping (Result<CategoryResponse?, Error>)->())
    
}
