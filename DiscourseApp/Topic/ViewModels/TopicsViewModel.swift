//
//  TopicViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation


class TopicsViewModel {
    
    // MARK: - Class Properties
    //Delegates
    weak var topicsViewDelegate:    TopicsViewDelegate?
    weak var coordinatorDelegate:   TopicsCoordinatorDelegate?
    
    //Managers
    var topicsDataManager:          TopicsDataManager
    
    //
    var topics =                    [Topic]()
    
    // MARK: - Lifecycle
    init(with dataManager: TopicsDataManager) {
        
        self.topicsDataManager = dataManager
        
    }
    
    
    // MARK: - Class Properties
    func viewWasLoad(){
        guard let fetchedTopics = topicsDataManager.fetchLatestTopics() else { return  }
        self.topics = fetchedTopics
    }
    
    
    func numberOfRows() -> Int{
        return topics.count
    }
    
}



extension TopicsViewModel{
    
    func didSelectATopic(){
        coordinatorDelegate?.didSelectATopic()
    }
    
}

