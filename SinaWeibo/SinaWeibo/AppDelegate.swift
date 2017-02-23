//
//  AppDelegate.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/7.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = WBMainViewController()
        window?.makeKeyAndVisible()
        
        loadAppInfo()
        
        return true
    }


}

extension AppDelegate {
    
    fileprivate func loadAppInfo() {
        
        DispatchQueue.main.async {
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)
            let data = NSData(contentsOf: url!)
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (path as NSString).appendingPathComponent("main.json")
            
            data?.write(toFile: jsonPath, atomically: true)
        }
    }
}
