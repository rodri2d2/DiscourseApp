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
    var topics:[Topic] = [] {
        didSet {
            self.topicsViewDelegate?.topicsFetched()
        }
    }
    
    // MARK: - Lifecycle
    init(with dataManager: TopicsDataManager) {
        
        self.topicsDataManager = dataManager
        
    }
    
    
    // MARK: - Class Properties
    func loadTopics(){
        topicsDataManager.fetchTopics { (result) in
            switch result{
                case .success(let response):
                    
                    guard let fetchedTopics = response?.topicList?.topics else { return }
                    self.topics = fetchedTopics
                case .failure(_):
                print("OOps..ha fallados")
            }
        }
    }
    
    func numberOfRows() -> Int{
        return topics.count
    }
    
    func didSelectATopic(at index: Int){
        if(index < self.topics.count){
            let topic = self.topics[index]
            coordinatorDelegate?.didSelectATopic(topic: topic)
        }
    }
    
}

