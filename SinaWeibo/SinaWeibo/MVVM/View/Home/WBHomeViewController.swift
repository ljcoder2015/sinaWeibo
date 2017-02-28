//
//  WBHomeViewController.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/7.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

fileprivate let cellID = "cellId"

class WBHomeViewController: WBBaseViewController {

    fileprivate lazy var statusList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 加载数据
    override func loadData() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            for i in 0..<10 {
                if self.isPull {
                    self.statusList.append("pull \(i)")
                }
                else {
                    self.statusList.insert(i.description, at: 0)
                }
                
            }
            
            self.refreshControl?.endRefreshing()
            self.isPull = false
            
            self.tableView?.reloadData()
        }
    }
    
    @objc fileprivate func showFriend () {
        print(#function)
        let friendVC = WBTestViewController()
        navigationController?.pushViewController(friendVC, animated: true)
    }

}

extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
}

// MARK: - setUI
extension WBHomeViewController {
    
    override func setupTableView() {
        super.setupTableView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "friend", style: .plain, target: self, action: #selector(showFriend))
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}
