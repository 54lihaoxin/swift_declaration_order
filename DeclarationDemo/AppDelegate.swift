//
//  AppDelegate.swift
//  DeclarationDemo
//
//  Created by Haoxin Li on 6/1/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window.rootViewController = DeclarationViewController(titles: ["apple", "orange", "banana"], delegate: DeclarationDelegate())
        window.makeKeyAndVisible()
        return true
    }
}

private class DeclarationDelegate: DeclarationViewControllerDelegate {
    
    func didSelect(title: DeclarationViewController.Title) {
        print("\(#function) \(title)")
    }
}
