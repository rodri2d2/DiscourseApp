//
//  CategoriesCoordinator.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation
import UIKit


class CategoriesCoodinator: Coordinator{
    
    // MARK: - Coordinator Implemented Properties
    var childrem: [Coordinator] = []
    
    // MARK: - Class Properties
    private let presenter: UINavigationController
    private let dataManager: CategoryDataManager
    
    // MARK: - Lifecycle
    init(with presenter: UINavigationController, dataManager: CategoryDataManager) {
        self.presenter = presenter
        self.dataManager = dataManager
    }
    
    
    // MARK: - Coordinator Implemented Methods
    func start() {
        
        
        let viewModel = CategoryViewModel(dataManager: self.dataManager)
        let controller = CategoriesViewController(viewModel: viewModel)
        viewModel.categoryViewDelegate = controller
        controller.title = "Categories"
        
        
        //
        presenter.pushViewController(controller, animated: true)
        
        
    }
    
    func finish() {
        
    }
    
    
}
