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
    
    // MARK: - Lifecycle
    init(with presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    
    // MARK: - Coordinator Implemented Methods
    func start() {
        
        
    }
    
    func finish() {
        
    }
    
    
}
