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
    private let detailDataManager: TopicDetailManager
    
    // MARK: - Lifecycle
    init(with presenter: UINavigationController,
              dataManager: TopicsDataManager,
              detailDataManager: TopicDetailManager) {
        
        self.presenter          = presenter
        self.dataManager        = dataManager
        self.detailDataManager  = detailDataManager
    }
    
    // MARK: - Coordinator Implemented Methods
    func start() {
        
        let topicViewModel  = TopicsViewModel(with: self.dataManager)
        let topicController = TopicsViewController(with: topicViewModel)
        
        topicViewModel.topicsViewDelegate  = topicController
        topicViewModel.coordinatorDelegate = self
        
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
        
        let detailViewModel  = TopicDetailViewModel(topic: topic, dataManager: self.detailDataManager)
        detailViewModel.detailCoordinator = self
        let detailController = TopicDetailViewController(topicDetailViewModel: detailViewModel)
        detailViewModel.detailViewDelegate = detailController
        presenter.pushViewController(detailController, animated: true)
    }

    
}

extension TopicCoordinator: TopicDetailCoodinatorDelegate{

    
    func didPressBacButton() {
        self.presenter.popViewController(animated: true)
    }
}
