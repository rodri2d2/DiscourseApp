//
//  UserCellViewModel.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import UIKit

class UserCellViewModel{
    
    // MARK: - Class Properties
    var userName:     String?
    var userNickName: String?
    var userImage:    UIImage?
    var user:         User
    
    
    init(with user: User) {
        self.user = user
        setUp()
    }
    
    private func setUp(){
        self.userName     = user.name
        self.userNickName = user.userName
        self.fetchUserImage(imageUrl: user.avatar)
    }
    
    
    func fetchUserImage(imageUrl: String){
        
        //Clean the sended string by replacing if exits {size} for 60
        let sanatizedUrl = imageUrl.replacingOccurrences(of: "{size}", with: "60")
        
        // TODO: - For a next version this call shoud go also on an data manage remote call
        let request = UserImageRequest(imageURL: sanatizedUrl)
        guard let url = request.request().url else { return }
        let networkService = NetworkService()
        networkService.fetchImage(imageURL: url) { (image) in
            self.userImage = image
        }
    }
    
}
