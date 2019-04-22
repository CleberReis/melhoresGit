//
//  AppDelegate.swift
//  melhoresGit
//
//  Created by Cleber Reis on 22/04/19.
//  Copyright © 2019 Cleber Reis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let main = UIViewController()
        main.view.backgroundColor = UIColor.groupTableViewBackground
        main.title = "Melhores do Git"
        
        window?.rootViewController = UINavigationController(rootViewController: main)
        window?.makeKeyAndVisible()
        
        return true
    }
}
