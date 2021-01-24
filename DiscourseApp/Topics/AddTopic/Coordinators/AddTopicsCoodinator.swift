//
//  AddTopicsCoodinator.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import UIKit


class AddTopicCoordinator: Coordinator{
    
    
    // MARK: - Class Propertiers
    let presenter: UINavigationController
    var addTopicNavigationController: UINavigationController?
    var onTopicCreated: (() -> Void)?
    
    
    //Managers
    let dataManager: AddTopicDataManager
    
    
    // MARK: - Protocol Properties Implementation
    var childrem: [Coordinator] = []
    
    init(presenter: UINavigationController, dataManager: AddTopicDataManager) {
        
        self.presenter   = presenter
        self.dataManager = dataManager
        
    }
    
    // MARK: - Protocol Methods Implementation
    func start() {
        
        let addTopicViewModel = AddTopicViewModel(dataManager: self.dataManager)
        addTopicViewModel.coordinatorDelegate = self
        
        let controller = AddTopicViewController(viewModel: addTopicViewModel )
        controller.title = "Create"
        controller.isModalInPresentation = true

        addTopicViewModel.addTopicDelegate = controller
        
        let navigationController = UINavigationController(rootViewController: controller)
        self.addTopicNavigationController = navigationController
        presenter.present(navigationController, animated: true, completion: nil)
    }
    
    func finish() {
        addTopicNavigationController?.dismiss(animated: true, completion: nil)
    }
}

extension AddTopicCoordinator: AddTopicCoordinatorDelegate{
    
    func didCancel() {
        self.finish()
    }
    
    func didsuccessfullyAdd() {
        self.onTopicCreated?()
    }
    
    
}
