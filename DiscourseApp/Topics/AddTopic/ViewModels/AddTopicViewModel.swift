//
//  AddTopicViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


class AddTopicViewModel{
    
    // MARK: - Class Properties
    
    //Delegates
    var coordinatorDelegate:  AddTopicCoordinatorDelegate?
    var addTopicDelegate:     AddNewTopicViewModelDelegate?
    
    //Manager
    let dataManager: AddTopicDataManager
    
    
    init(dataManager: AddTopicDataManager) {
        self.dataManager = dataManager
    }
    
    
    func createNewTopic(title: String, raw: String){
        dataManager.didAddTopic(title: title, raw: raw) { (result) in
            switch result{
                case .success(_):
                    self.coordinatorDelegate?.didsuccessfullyAdd()
                case .failure(let error):
                    self.addTopicDelegate?.didFailToCreateTopic(error: error.localizedDescription)
            }
        }
    }
    
}
