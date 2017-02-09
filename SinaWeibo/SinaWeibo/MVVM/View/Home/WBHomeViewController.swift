//
//  WBHomeViewController.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/7.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func showFriend () {
        print(#function)
        let friendVC = WBTestViewController()
        friendVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(friendVC, animated: true)
    }

}

extension WBHomeViewController {
    
    override func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "friend", style: .plain, target: self, action: #selector(showFriend))
    }
}
