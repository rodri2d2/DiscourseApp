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
        
        
        let topicViewModel  = TopicsViewModel(with: self.topicsDataManager)
        let topicController = TopicsViewController(with: topicViewModel)
        
        topicViewModel.topicsViewDelegate  = topicController
        topicViewModel.coordinatorDelegate = self
        
        
        self.topicsViewModel = topicViewModel
        presenter.pushViewController(topicController, animated: true)
        
    }
    
    func finish() {
        
    }
}

extension TopicCoordinator: TopicsCoordinatorDelegate {

    func didSelectATopic(topic: Topic) {
        
        
        /** TODO: Lanzar módulo TopicDetail
         Para ello tendrás que crear TopicDetailViewModel, TopicDetailViewController.
         Asignar "self" como coordinatorDelegate del módulo: Queremos escuchar eventos que requieren navegación desde ese módulo.
         Asignar el VC al viewDelegate del VM. De esta forma, el VC se enterará de lo necesario para pintar la UI
         Finalmente, lanzar el TopicDetailViewController sobre el presenter.
         */
        
        let detailViewModel  = TopicDetailViewModel(topic: topic, dataManager: self.topicDetailDataManager)
        detailViewModel.detailCoordinator = self
        let detailController = TopicDetailViewController(topicDetailViewModel: detailViewModel)
        detailViewModel.detailViewDelegate = detailController
        presenter.pushViewController(detailController, animated: true)
    }
    
    func didPressPlusButton() {
        
        let addTopicCoordinator = AddTopicCoordinator(presenter: self.presenter, dataManager: self.addTopicDataManager)
        addTopicCoordinator.start()
        childrem.append(addTopicCoordinator)
        
        addTopicCoordinator.onTopicCreated = { [weak self] in
            self?.topicsViewModel?.didCreatedNewTopic()
            addTopicCoordinator.finish()
        }
        
    }
    
}

extension TopicCoordinator: TopicDetailCoodinatorDelegate{

    
    func didPressBackButton() {
        self.presenter.popViewController(animated: true)
    }
}
