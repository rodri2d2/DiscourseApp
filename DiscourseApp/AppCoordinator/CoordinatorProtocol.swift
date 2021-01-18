//
//  CoordinatorProtocol.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation


protocol Coordinator {
    
    var childrem: [Coordinator] { get set }
    func start()
    func finish()
    
}
