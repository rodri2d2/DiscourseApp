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
    var topicsViewModel:            [TopicCellViewModel] = []
    
    // MARK: - Lifecycle
    init(with dataManager: TopicsDataManager) {
        self.topicsDataManager = dataManager
    }
    
    // MARK: - Class Properties
    func loadTopics(){
        topicsDataManager.fetchTopics { (result) in
            switch result{
                //
                case .success(let response):
                    guard let fetchedTopics = response?.topicList?.topics else { return }
                    for topic in fetchedTopics{
                        self.topicsViewModel.append(TopicCellViewModel(with: topic))
                    }
                    self.topicsViewDelegate?.topicsFetched()
                //
                case .failure(let error):
                    self.topicsViewDelegate?.didFailToFetchTopics(error: error.localizedDescription)
            }
        }
    }
    
    func numberOfTopics() -> Int{
        return topicsViewModel.count
    }
    
    func viewModel(index: Int) -> TopicCellViewModel?{
        guard index < topicsViewModel.count else { return nil }
        return topicsViewModel[index]
    }
    
    func didSelectATopic(at index: Int){
        guard index < topicsViewModel.count else { return }
        let topic = topicsViewModel[index].topic
        coordinatorDelegate?.didSelectATopic(topic: topic)
        
    }
    
    func didPressPlusButton(){
        coordinatorDelegate?.didPressPlusButton()
    }
    
    func didCreatedNewTopic(){
        loadTopics()
    }
    
}

