//
//  AppDelegate.swift
//  AutoLayoutExample
//
//  Created by NSSimpleApps on 14.05.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var bannerWindow: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let mainScreen = UIScreen.main.bounds
        
//        self.bannerWindow = UIWindow(frame: mainScreen)
//        self.bannerWindow?.windowLevel = UIWindowLevelNormal
//        self.bannerWindow?.makeKeyAndVisible()
//        self.bannerWindow?.rootViewController = BottomViewController()
//        self.bannerWindow?.frame = mainScreen
//        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let resizedFrame = CGRect(origin: mainScreen.origin, size: CGSize(width: mainScreen.width, height: mainScreen.height - 50))
        
        self.window = UIWindow(frame: resizedFrame)
        self.window?.windowLevel = UIWindowLevelNormal
        self.window?.rootViewController = sb.instantiateViewController(withIdentifier: "RootViewController")
        self.window?.makeKeyAndVisible()
        //self.window?.frame = resizedFrame
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        return .allButUpsideDown
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        print(#function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        print(#function)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        print(#function)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        print(#function)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        print(#function)
    }


}

