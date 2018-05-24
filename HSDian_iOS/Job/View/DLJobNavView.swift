//
//  DLJobNavView.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/23.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class DLJobNavView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: LUIs
    func prepareView() {
        addSubview(topNavView)
        addSubview(searchButton)
        
        topNavView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        searchButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(-10)
            make.height.equalTo(33)
        }
    }
    
    // MARK: update
    var offsetY: CGFloat = 0.0 {
        didSet {
            let alpha = offsetY / (DLStatusBarHeight + DLnavigationBarHeight)
            topNavView.alpha = alpha
            if alpha <= 0.5 {
                searchButton.setBackgroundImage(UIImage(named:"home_top_search_Image"), for: .normal)
            }else{
                searchButton.setBackgroundImage(UIImage(named:"home_top_search_picture"), for: .normal)
            }
        }
    }
    
    // MARK: GUIs
    /// nav背景
    lazy var topNavView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.alpha = 0
        return view
    }()
    /// 搜索按钮
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        button.setBackgroundImage(UIImage(named:"home_top_search_picture"), for: .normal)
        button.setTitle("🔍   搜索职位/公司  ", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
}
