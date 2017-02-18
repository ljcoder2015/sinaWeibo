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
    
    // 属性
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    var isPull = false
    var userLogin = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        refreshControl?.endRefreshing()
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


// MARK: - 设置界面
extension WBBaseViewController {
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        
        
        setupNavigation()
        userLogin ? setupTableView() : setupVisitorView()
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
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 0, right: 0)
        view.addSubview(tableView!)
        
        // 设置刷新
        refreshControl = UIRefreshControl()
        
        tableView?.addSubview(refreshControl!)
        
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    fileprivate func setupVisitorView() {
        let visitorView = UIView(frame: view.bounds)
        visitorView.backgroundColor = UIColor.blue
        view.addSubview(visitorView)
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension WBBaseViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) && !isPull {
            isPull = true
            loadData()
        }
        
    }
}
