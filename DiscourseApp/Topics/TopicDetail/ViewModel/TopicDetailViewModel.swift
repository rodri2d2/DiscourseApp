//
//  TopicDetailViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


class TopicDetailViewModel{
    
    // MARK: - Class Properties
    //Delegates
    weak var detailViewDelegate: TopicDetailViewDelegate?
    weak var detailCoordinator:  TopicDetailCoodinatorDelegate?
    
    // Manager
    var topicDetailManager: TopicDetailManager?
        
    //
    let topic:          Topic
    var detailId:       String?
    var detailTitle:    String?
    var numberOfPosts:  Int?
    var isDeletable:    Bool?
    
    init(topic: Topic, dataManager: TopicDetailManager) {
        self.topic              = topic
        self.topicDetailManager = dataManager
    }
    
    
    func loadDetail(){
        let id = self.topic.id
        topicDetailManager?.fetchTopic(id: id, completion: { (result) in
            
            switch result {
                
                case .success(let response):
                    self.detailId       = response?.id.description
                    self.detailTitle    = response?.title
                    self.numberOfPosts  = response?.numberOfPosts
   
                    if let deletable = response?.details.isDeletable{
                        
                        self.isDeletable = deletable
                        
                    }else{
                        self.isDeletable = false
                    }
  
                    self.detailViewDelegate?.didFetchTopic()
                case .failure(_):
                    print("Fail to detail")
            }
            
        })
        
    }
    
    func didPressBackButton(){
        self.detailCoordinator?.didPressBackButton()
    }
    
    func didPressDeleteButton(id: Int){
        topicDetailManager?.deleteTopic(id: id, completion: { (result) in
            switch result{
                case .success(_):
                    self.detailViewDelegate?.didDeleteTopic()
                case .failure(_):
                    print("oooops... something went wrong this deleting")
            }
        })
    }
    
}
