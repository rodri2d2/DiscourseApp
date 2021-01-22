//
//  UserViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 21/1/21.
//

import Foundation


protocol UserViewModelDelegate: class {
    func didFetchUsers()
    func didFetchUserAvatar()
    func didFailToFetchUser(error: String)
}
