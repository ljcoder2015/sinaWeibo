//
//  WBMainViewController.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/7.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension WBMainViewController {
    
    fileprivate func setupChildViewController() {
        let array = [["clsName": "WBHomeViewController", "title": "首页", "imageName": "ico"],
                     ["clsName": "WBMessageViewController", "title": "消息", "imageName": "ico"],
//                     ["clsName": "WBDiscoverViewController", "title": "发现", "imageName": "ico"],
                     ["clsName": "WBProfileViewController", "title": "我", "imageName": "ico"]]
        var chirld = [UIViewController]()
        for dic in array {
            
            chirld.append(controller(dict: dic))
        }
        
        viewControllers = chirld
    }
    
    private func controller(dict: [String: String]) -> UIViewController {
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString((Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "") + "." + clsName) as? UIViewController.Type
            else {
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14)], for: .selected)
        let navigationController = UINavigationController(rootViewController: vc)
        
        return navigationController
    }
}
