//
//  TopicCoordinator.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation
import UIKit

class TopicCoordinator: Coordinator {
    
    // MARK: - Coordinator Implemented Properties
    var childrem: [Coordinator] = []
    
    // MARK: - Class Properties
    private let presenter:   UINavigationController
    private let dataManager: TopicsDataManager
    
    // MARK: - Lifecycle
    init(with presenter: UINavigationController, dataManager: TopicsDataManager) {
        self.presenter   = presenter
        self.dataManager = dataManager
    }
    
    // MARK: - Coordinator Implemented Methods
    func start() {
        
        let topicViewModel  = TopicsViewModel(with: self.dataManager)
        let topicController = TopicsViewController(with: topicViewModel)
        topicViewModel.coordinatorDelegate = self
        presenter.pushViewController(topicController, animated: true)
        
    }
    
    func finish() {
        
    }
}

extension TopicCoordinator: TopicsCoordinatorDelegate {
    func didSelectATopic() {
       
    }
    
    func didPressBackButton() {
        print("going back!")
    }
    
    
}
