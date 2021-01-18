//
//  ViewControllersArray.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import UIKit

/**
 This is a utility class
 That with a unique method the returns a array of UIViewControllers to be use for Create a TabBar
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
struct ControllersSet {
    
    private var topicViewController: UINavigationController {
        let vc = UINavigationController()
        vc.tabBarItem.title = "Topics"
        vc.tabBarItem.image = UIImage(systemName: "list.dash")
        return vc
    }

    private var categoriesViewController: UINavigationController {
        let vc = UINavigationController()
        vc.tabBarItem.title = "Categories"
        vc.tabBarItem.image = UIImage(systemName: "tag")
        return vc
    }
    
    private var usersViewController: UINavigationController {
        let vc = UINavigationController()
        vc.tabBarItem.title = "Users"
        vc.tabBarItem.image = UIImage(systemName: "person.3")
        return vc
    }
    
    /// A Dictionary of UIViewControllers
    /// Each ViewController that will be included in the main TabBar must be instantiated
    /// and than passed through this method
    /// - Returns:  Dictionary<String, UINavigationController>
    func controllersDictionary() -> Dictionary<String, UINavigationController> {
        
        var controllersDictionary = Dictionary<String, UINavigationController>()
        
        controllersDictionary["topics"]     = topicViewController
        controllersDictionary["categories"] = categoriesViewController
        controllersDictionary["users"]      = usersViewController
        
        return controllersDictionary
    }
    
}
