//
//  UsersCoordinatorDelegate.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import Foundation


protocol UsersCoordinatorDelegate: class {
    func didSelectUser(user: User)
}
