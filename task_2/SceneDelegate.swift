//
//  SceneDelegate.swift
//  task_2
//
//  Created by Artem Sulzhenko on 12.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MainTableViewController()
        window?.makeKeyAndVisible()
        
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//               window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//               window?.windowScene = windowScene
//               
//               self.window = UIWindow(windowScene: windowScene)
//
//               let vc = MainTableViewController()
//               let rootNC = UINavigationController(rootViewController: vc)
//
//               self.window?.rootViewController = rootNC
//               self.window?.makeKeyAndVisible()    }
    }


}

