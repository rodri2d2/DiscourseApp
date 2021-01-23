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
    private let userDetailDataManager: UserDetailDataManager
    
    // MARK: - Lifecycle
    init(with presenter: UINavigationController, userDataManager: UserDataManager, userDetailDataManager: UserDetailDataManager) {
        self.presenter             = presenter
        self.dataManager           = userDataManager
        self.userDetailDataManager = userDetailDataManager
    }
    
    
    // MARK: - Coordinator Implemented Methods
    func start() {
        
        let viewModel  = UserViewModel(dataManager: self.dataManager)
        viewModel.userCoordinatorDelegate = self
        let controller = UsersViewController(userViewModel: viewModel)
        viewModel.userViewModelDelegate = controller
        
        presenter.pushViewController(controller, animated: true)
        
    }
    
    func finish() {}
    
}


extension UsersCoordinator: UsersCoordinatorDelegate{
    
    func didSelectUser(user: User) {
    
        let detailViewModel = UserDetailViewModel(user: user, dataManager: userDetailDataManager)
        let controller = UserDetailViewController(viewModel: detailViewModel)
        detailViewModel.userDetailDelegate = controller
        controller.title = "User Detail"
        presenter.pushViewController(controller, animated: true)
        
    }
    
}


