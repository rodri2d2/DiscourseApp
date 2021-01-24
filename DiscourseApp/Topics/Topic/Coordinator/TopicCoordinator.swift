//
//  TopicCoordinator.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation
import UIKit

/**
 This class controls Topics Navigation flow
 
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
class TopicCoordinator: Coordinator {
    
    // MARK: - Coordinator Implemented Properties
    var childrem: [Coordinator] = []
    
    // MARK: - Class Properties
    private let presenter:       UINavigationController
    private var topicsViewModel: TopicsViewModel?
    
    //DataManagers
    private let topicsDataManager:      TopicsDataManager
    private let topicDetailDataManager: TopicDetailManager
    private let addTopicDataManager:    AddTopicDataManager

    
    // MARK: - Lifecycle
    init(with presenter:               UINavigationController,
              topicsDataManager:       TopicsDataManager,
              topicsDetailDataManager: TopicDetailManager,
              addTopicDataManager:     AddTopicDataManager) {
        
        self.presenter               = presenter
        self.topicsDataManager       = topicsDataManager
        self.topicDetailDataManager  = topicsDetailDataManager
        self.addTopicDataManager     = addTopicDataManager
    }
    
    // MARK: - Coordinator Implemented Methods
    func start() {
        
        
        // Latest Topics
        let topicViewModel  = TopicsViewModel(with: self.topicsDataManager)
        let topicController = TopicsViewController(with: topicViewModel)
        self.topicsViewModel = topicViewModel
        
        topicController.title = "Latest Topics"
        topicViewModel.topicsViewDelegate  = topicController
        topicViewModel.coordinatorDelegate = self
        
        //Present View
        presenter.pushViewController(topicController, animated: true)
        
    }
    
    func finish() {}
}

// MARK: - Extension for TopicsCoordinatorDelegate
extension TopicCoordinator: TopicsCoordinatorDelegate {

    func didSelectATopic(topic: Topic) {
        
        let detailViewModel  = TopicDetailViewModel(topic: topic, dataManager: self.topicDetailDataManager)
            detailViewModel.detailCoordinator = self
        
        let detailController = TopicDetailViewController(topicDetailViewModel: detailViewModel)
            detailViewModel.detailViewDelegate = detailController
        
        //Present View
        presenter.pushViewController(detailController, animated: true)
    }
    
    func didPressPlusButton() {
        
        let addTopicCoordinator = AddTopicCoordinator(presenter: self.presenter, dataManager: self.addTopicDataManager)
        addTopicCoordinator.start()
        
        addTopicCoordinator.onTopicCreated = { [weak self] in
            addTopicCoordinator.finish()
            self?.topicsViewModel?.loadTopics()
        }
    }

}
// MARK: - Extension for TopicDetailCoodinatorDelegate
extension TopicCoordinator: TopicDetailCoodinatorDelegate{
    func didPressBackButton() {
        self.presenter.popViewController(animated: true)
    }
}
