//
//  WBBaseViewController.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/7.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension WBBaseViewController {
    func setupUI() {
        view.backgroundColor = UIColor.white
    }
}
