//
//  UserDetailViewModelDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 23/1/21.
//

import Foundation


protocol UserDetailViewModelDelegate: class{
    func didLoadUser()
    func didUpdateUser()
    func didFailToUpdateUser(error: String)
    func didFailToLoadUser(error: String)
}
