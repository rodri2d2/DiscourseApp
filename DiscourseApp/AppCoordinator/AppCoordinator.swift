//
//  AppCoordinator.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import Foundation
import UIKit

/**
 This class controls the entire app navigation based on Coordinator Pattern. It is Main Coordinator Class
 
 This class controls an app navigation based also on TabBar Navigation. Its start method asign to app Window a rootNavigationController as UITarViewController.
 
 - Author: Rodrigo Candido
 - Version: v1.0
 */
class AppCoordinator: Coordinator{
    
    
    // MARK: - Class Properties
    let window: UIWindow!
    let arrayOfViewControllers = ControllersSet()//Utility class to create TabBars
    
    // MARK: - Coordinator Protrocol Properties
    var childrem: [Coordinator] = []//Other class that also conform to Coordinator protocol and make part of this main flow
    
    // MARK: - Lifecycle
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Coordinator Protrocol Methods
    func start() {
        
        let setOfControllers = arrayOfViewControllers.controllersDictionary()
        let tabBarController = UITabBarController()
        
        let remoteManager   = RemoteDataManagerImpl(networkService: NetworkService())
        let dataManager     = DiscourseClientDataManager(manager: remoteManager)
        
        //Topics
        guard let topicController = setOfControllers["topics"] else {return}
        let topicCoordinator = TopicCoordinator(with: topicController,
                                                topicsDataManager:       dataManager,
                                                topicsDetailDataManager: dataManager,
                                                addTopicDataManager:     dataManager)
        topicCoordinator.start()
        
        //Categories
        guard let categoryController = setOfControllers["categories"] else {return}
        let categoryCoordinator = CategoriesCoodinator(with: categoryController,
                                                       dataManager: dataManager)
        categoryCoordinator.start()
        
        //Users
        guard let usersController = setOfControllers["users"] else {return}
        let usersCoordinator = UsersCoordinator(with: usersController,
                                                userDataManager:       dataManager,
                                                userDetailDataManager: dataManager)
        usersCoordinator.start()
        
        //Add children
        self.childrem.append(topicCoordinator)
        self.childrem.append(categoryCoordinator)
        self.childrem.append(usersCoordinator)
        
        //Setup TabBar
        tabBarController.viewControllers = [topicController, categoryController, usersController]
        
        //RootViewControllwe will be Coodinator's navigation controller
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    
    func finish() {}
    
}
