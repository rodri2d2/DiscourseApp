//
//  UserDetailViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation


class UserDetailViewModel {

    // MARK: - Class Properties
    var user: User
    var isEditable: Bool?
    var userId:     String?
    var userName:   String?
    var userNick:   String?
    
    //Delegates
    weak var userDetailDelegate:     UserDetailViewModelDelegate?
    weak var userCoorinatorDelegate: UserDetailCoordinatorDelegate?
    
    //Managers
    var dataManager: UserDetailDataManager
    
 
    
    
    init(user: User, dataManager: UserDetailDataManager) {
        self.dataManager = dataManager
        self.user        = user
    }
    
    
    func loadUser(){
        let userNick = user.userName
        dataManager.fetchUser(userName: userNick) { (result) in
            switch result{
                case .success(let response):
                    guard let user = response?.user else {
                        self.userDetailDelegate?.didFailToLoadUser(error: "Fail to get final information")
                        return
                    }
                    self.setupUserProperties(user: user)
                    self.userDetailDelegate?.didLoadUser()
                case .failure(let error):
                    self.userDetailDelegate?.didFailToLoadUser(error: error.localizedDescription)
            }
        }
    }
    
    
    func updateUser(userNick: String, newName: String){
        dataManager.updateUser(user: userNick, newName: newName) { (result) in
            switch result{
                case .success(let response):
                    guard let user = response?.user else {
                        self.userDetailDelegate?.didFailToLoadUser(error: "Fail to get final information")
                        return
                    }
                    self.setupUserProperties(user: user)
                    self.userDetailDelegate?.didUpdateUser()
                case .failure(let error):
                    self.userDetailDelegate?.didFailToUpdateUser(error: error.localizedDescription)
            }
        }
    }
    
    private func setupUserProperties(user: User){
        self.userId     = String(user.id)
        self.userNick   = user.userName
        self.userName   = user.name
        
        if let editable = user.canEditName{
            self.isEditable = editable
        }
    
    }
    
}
