//
//  WBTestViewController.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/9.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

class WBTestViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func showNext() {
        let nextVC = WBTestViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension WBTestViewController {
    override func setupUI() {
        super.setupUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", target: self, action: #selector(showNext))
    }
}
