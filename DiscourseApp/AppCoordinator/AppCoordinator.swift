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
    var childrem: [Coordinator] = []
    
    
    // MARK: - Lifecycle
    init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: - Coordinator Protrocol Methods
    func start() {
        
        let setOfControllers = arrayOfViewControllers.controllersDictionary()
        let tabBarController = UITabBarController()
        
        //Topics
        guard let topicController = setOfControllers["topics"] else {return}
        let topicCoordinator = TopicCoordinator(with: topicController, dataManager: TopicsDataManager())
        topicCoordinator.start()
        
        //Categories
        guard let categoryController = setOfControllers["categories"] else {return}
        let categoryCoordinator = CategoriesCoodinator(with: categoryController)
        categoryCoordinator.start()
                
        //Users
        guard let usersController = setOfControllers["users"] else {return}
        let usersCoordinator = UsersCoordinator(with: usersController)
        usersCoordinator.start()
        
        
        //Add children
        self.childrem.append(topicCoordinator)
        self.childrem.append(categoryCoordinator)
        self.childrem.append(usersCoordinator)
        
        //Setup TabBar
        tabBarController.viewControllers = [topicController, categoryController, usersController]
        
        
        
        // Nos aseguramos de inicializar la propiedad window asignándole un frame del tamaño de la pantalla, el rootViewController será el UINavigationController del coordinator y finalmente al método makeKeyAndVisible para hacer la ventana visible.
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        
        
    }
    
    func finish() {
        
    }
    
    
}