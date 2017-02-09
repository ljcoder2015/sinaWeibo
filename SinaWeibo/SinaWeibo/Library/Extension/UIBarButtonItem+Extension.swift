//
//  UIBarButtonItem+Extension.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/9.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// 创建UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: 按钮标题
    ///   - fontSize: 字体大小
    ///   - target: target
    ///   - action: 点击事件
    convenience init(title: String, fontSize: CGFloat = 20, target: Any?, action: Selector) {
        
        let button: UIButton = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: (button.titleLabel?.bounds.size.width) ?? 0, height: (button.titleLabel?.bounds.size.height) ?? 0)
        button.setTitleColor(UIColor.darkText, for: .normal)
        button.setTitleColor(UIColor.orange, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: button)
    }
}
