//
//  CoordinatorProtocol.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation


/**
 Coordinator Pattern based protocol
 
 Use this protocol to implement a navigation flow based on **Coordinator Pattern**
 
 */
protocol Coordinator {
    
    
    /// All class that conforms this protocol and has a Coordinator flow
    var childrem: [Coordinator] { get set }
    
    
    /// Start method to be called whenever the setup of its implemented class has finished.
    func start()
    
    
    /// Use this to finish a navigation flow
    func finish()
    
}
