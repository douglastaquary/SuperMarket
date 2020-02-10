//
//  AppDelegate.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    // CONTAINER
    func loadContent(with completion: @escaping (Result<[ShoppingList], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(shopping))
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()

        let stateController = StateViewController()
        stateController.title = "Container"

        loadContent { result in
            switch result {
            case .success(let content):
                if content.isEmpty {
                    stateController.state = .empty(message: "There is no content here, this is an empty message.")
                } else {
                    stateController.state = .content(controller: ContentViewController(content: content))
                }
            case .failure(let error):
                stateController.state = .error(message: error.localizedDescription)
            }
        }
        
        // GENERIC CONTROLLER
        let genericController = GenericCollectionViewController(viewType: ShoppingListView.self)

        genericController.numberOfItems = { shopping.count }
        genericController.configureView = { $1.label.text = shopping[$0.item].title }
        genericController.didSelectView = { i, _ in print(shopping[i.item]) }
        genericController.title = "Generic"

        
        // FLOW CONTROLLER
        let flowController = SuperMarketFlowController()
        flowController.title = "Flow"

        let tabController = UITabBarController()
        tabController.viewControllers = [stateController, genericController, flowController]
        //tabController.setViewControllers([stateController, genericController, flowController], animated: false)
        
        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

