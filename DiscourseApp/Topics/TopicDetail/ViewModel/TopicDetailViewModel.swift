//
//  TopicDetailViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


/**
This class controls and manage **Topic Data Type**
 
Use this class to apply business logic for a Single Topic. Fetch from an API or Local Storage
Apply its detailViewDelegate to a ViewController/View class to notify any necessary change to the UI
 
 */
class TopicDetailViewModel{
    
    // MARK: - Class Properties
    //Delegates
    weak var detailViewDelegate: TopicDetailViewDelegate?
    weak var detailCoordinator:  TopicDetailCoodinatorDelegate?
    
    // Managers
    var topicDetailManager: TopicDetailManager?
        
    //
    let topic:          Topic
    var detailId:       String?
    var detailTitle:    String?
    var numberOfPosts:  Int?
    var isDeletable:    Bool = false
    var isClosed:       Bool = false
    
    init(topic: Topic, dataManager: TopicDetailManager) {
        self.topic              = topic
        self.topicDetailManager = dataManager
    }
    
    
    /// Will load a single topic
    func loadDetail(){
        let id = self.topic.id
        topicDetailManager?.fetchTopic(id: id, completion: { (result) in
            
            switch result {
                
                case .success(let response):
                    guard let topic = response else{return}
                    self.setupProperties(topic: topic)
                    self.detailViewDelegate?.didFetchTopic()
                    
                case .failure(let error):
                    self.detailViewDelegate?.didFailToFetchTopic(error: error.localizedDescription)
            }
        })
    }
    
    
    /// Will notify self coordinator that a BackButton event occurred
    func didPressBackButton(){
        self.detailCoordinator?.didPressBackButton()
    }
    
    
    /// Will delete sended Topic.
    /// Source independent(Remote or Local)
    /// - Parameter id: type Int
    func didPressDeleteButton(id: Int){
        topicDetailManager?.deleteTopic(id: id, completion: { (result) in
            switch result{
                case .success(_):
                    self.detailViewDelegate?.didDeleteTopic()
                case .failure(let error):
                    self.detailViewDelegate?.didFailToFetchTopic(error: error.localizedDescription)
            }
        })
    }
    
    
    private func setupProperties(topic: SingleTopicResponse){
        self.detailId       = topic.id.description
        self.detailTitle    = topic.title
        self.numberOfPosts  = topic.numberOfPosts

        if let deletable = topic.details.isDeletable {
            self.isDeletable = deletable
        }
        
        if let closed = topic.closed{
            self.isClosed = closed
        }
    }
    
}
