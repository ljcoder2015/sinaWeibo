//
//  WBVisitorView.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/18.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {

    var visitorInfo: [String: String]? {
        didSet {
            guard let imageName = visitorInfo?["imageName"] else {
                return
            }
            if imageName == "" {
                startAnimation()
                return
            }
            iconView.image = UIImage(named: imageName)
        }
    }
    
    // MARK: - 构造函数
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 私有控件
    fileprivate  lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "ico"))
    
    fileprivate func startAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = 2 * M_PI
        animation.repeatCount = MAXFLOAT
        animation.duration = 15
        animation.isRemovedOnCompletion = false
        iconView.layer.add(animation, forKey: nil)
    }
}

extension WBVisitorView {
    
    fileprivate func setupUI() {
        
        addSubview(iconView)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        addConstraints([centerX, centerY])
    }
    
}
