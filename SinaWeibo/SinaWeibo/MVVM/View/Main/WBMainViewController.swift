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
        setupComposeButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 屏幕方向
    // 设置支持方向后，当前的控制器及自控制器都会遵守这个方向
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
    
    // MARK: - 按钮事件
    // FIXME: 待实现
    // @objc 允许这个函数在运行时通过OC的消息机制被调用
    @objc fileprivate func compose() {
        print("按钮点击")
    }
    // MARK: - 私有变量
    fileprivate lazy var composeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "ico"), for: .normal)
        button.backgroundColor = UIColor.green
//        button.contentVerticalAlignment = .top
        return button
    }()
    

}

extension WBMainViewController {
    
    fileprivate func setupChildViewController() {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (path as NSString).appendingPathComponent("main.json")
        
        var data = NSData(contentsOfFile: jsonPath)
        
        if data == nil {
            let localPath = Bundle.main.path(forResource: "main", ofType: "json")
            data = NSData(contentsOfFile: localPath!)
        }
        
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: Any]] else {
            return
        }
        
        var chirld = [UIViewController]()
        for dic in array! {
            
            chirld.append(controller(dict: dic))
        }
        
        viewControllers = chirld
    }
    
    fileprivate func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        let width = tabBar.bounds.width/5-1
        composeButton.frame = tabBar.bounds.insetBy(dx: width*2, dy: 5)
        
        composeButton.addTarget(self, action: #selector(compose), for: .touchUpInside)
        
    }
    
    private func controller(dict: [String: Any]) -> UIViewController {
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString((Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "") + "." + clsName) as? WBBaseViewController.Type,
            let visitoreDict = dict["visitorInfo"] as? [String: String]
            else {
                return UIViewController()
        }
        
        let vc = cls.init()
        
        vc.title = title
        // 设置访客视图
        vc.visitorInfo = visitoreDict
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14)], for: .selected)
        
        let navigationController = WBNavigationViewController(rootViewController: vc)
        
        return navigationController
    }
}
