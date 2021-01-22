//
//  CategoryViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation

protocol CategoryViewModelDelegate: class {
    func didFetchCategories()
    func didFailToFetchCategories(error: String)
}
