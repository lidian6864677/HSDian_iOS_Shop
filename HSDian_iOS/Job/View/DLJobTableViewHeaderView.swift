//
//  DLJobTableViewHeaderView.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/22.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class DLJobTableViewHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: LUIs
    private func prepareViews() {
        addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    // MARK: GUIs
    /// 头部背景
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "home_top_image")
        return imageView
    }()
   
  
}
