//
//  UsersCoordinator.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation
import UIKit

class UsersCoordinator: Coordinator{
    
    // MARK: - Coordinator Implemented Properties
    var childrem: [Coordinator] = []
    
    // MARK: - Class Properties
    private let presenter: UINavigationController
    private let dataManager: UserDataManager
    
    // MARK: - Lifecycle
    init(with presenter: UINavigationController, userDataManager: UserDataManager) {
        self.presenter = presenter
        self.dataManager = userDataManager
    }
    
    
    // MARK: - Coordinator Implemented Methods
    func start() {
        
        let viewModel = UserViewModel(dataManager: self.dataManager)
        let controller = UsersViewController(userViewModel: viewModel)
        viewModel.userViewModelDelegate = controller
        presenter.pushViewController(controller, animated: true)
        
    }
    
    func finish() {
        
    }
    
    
}
