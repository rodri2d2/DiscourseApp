//
//  UsersCoordinatorDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation


protocol UserCoordinatorDelegate: class {
    func didSelectUser(userId: Int)
}
