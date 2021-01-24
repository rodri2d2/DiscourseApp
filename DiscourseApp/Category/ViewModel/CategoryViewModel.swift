//
//  CategoryViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation


class CategoryViewModel{
    
    // MARK: - Class Properties
    var categories: [Category] = []{
        didSet{
            self.categoryViewDelegate?.didFetchCategories()
        }
    }
    
    //Delegates
    weak var categoryViewDelegate: CategoryViewModelDelegate?
    
    //Managers
    var categoryDataManager: CategoryDataManager
    
    init(dataManager: CategoryDataManager) {
        self.categoryDataManager = dataManager
    }
    
    /// Return number of elements on category data
    /// - Returns: type Int
    func numberOfRows() -> Int{
        return categories.count
    }
    
    /// Load categories data
    func fetchCategories() {
        categoryDataManager.fetchCategories { (result) in
            switch result {
                case .success(let response):
                    guard let fetchedCategories = response?.categoryList?.categories else { return }
                    self.categories = fetchedCategories
                case .failure(let error):
                    self.categoryViewDelegate?.didFailToFetchCategories(error: error.localizedDescription)
            }
        }
    }
}
