//
//  SceneDelegate.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // CONTAINER
    func loadContent(with completion: @escaping (Result<[ShoppingList], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(shopping))
        }
    }


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
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
        
//        
//
//        let window = UIWindow(windowScene: windowScene)
//        let timeline = TimelineViewController()
//
//        let window = UIWindow(windowScene: windowScene)
//
//        let navigation = UINavigationController(rootViewController: timeline)
//        window.rootViewController = navigation
//
//        self.window = window
//        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

