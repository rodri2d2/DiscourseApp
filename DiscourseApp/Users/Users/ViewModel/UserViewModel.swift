//
//  UserViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import UIKit


class UserViewModel{
    
    // MARK: - Class Properties    
    var userCellViewModel: [UserCellViewModel] = []
    
    var image: UIImage?
    
    //Delegates
    weak var userViewModelDelegate:     UserViewModelDelegate?
    weak var userCoordinatorDelegate:   UsersCoordinatorDelegate?
    
    //Managers
    var dataManager: UserDataManager
    
    init(dataManager: UserDataManager) {
        self.dataManager = dataManager
    }
    
    func numberOfUsers() -> Int{
        return userCellViewModel.count
    }
    
    func fetchUsers() {
        dataManager.fetchUsers { (result) in
            switch result {
                case .success(let response):
                    
                    let fetchedUsers: [User] = response!.directoryItems.map({ directoryItem in
                        return directoryItem.user
                    })
                    
                    for user in fetchedUsers{
                        self.userCellViewModel.append(UserCellViewModel(with: user))
                    }
                    self.userViewModelDelegate?.didFetchUsers()
                    
                case .failure(let error):
                    self.userViewModelDelegate?.didFailToFetchUser(error: error.localizedDescription)
            }
        }
    }
    
    func viewModel(index: Int) -> UserCellViewModel?{
        guard index < userCellViewModel.count else { return nil }
        return userCellViewModel[index]
    }
    
    func didSelectUser(index: Int){
        let user = self.userCellViewModel[index].user
        self.userCoordinatorDelegate?.didSelectUser(user: user)
    }
    
}
