//
//  WBBaseViewController.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/7.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    var showBackItem: Bool? {
        didSet {
            guard let show = showBackItem else {
                return
            }
            if show {
                navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", target: self, action: #selector(goBack))
            }
            
        }
    }
    
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func goBack() {
        if (presentedViewController != nil) {
            dismiss(animated: true, completion: {
                
            })
        }
        else {
            guard let navigation = navigationController else {
                return
            }
            if navigation.childViewControllers.count <= 1 {
                dismiss(animated: true, completion: {})
            }
            else {
                _ = navigationController?.popViewController(animated: true)
            }
        }
    }
    
}

extension WBBaseViewController {
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        
        setupTableView()
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        // 设置导航栏
        guard let navigation = navigationController else {
            return
        }
        
        navigation.navigationBar.barTintColor = UIColor.white
        
        if navigation.childViewControllers.count > 1 {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", target: self, action: #selector(goBack))
        }
    }
    
    fileprivate func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView!)
    }
}
