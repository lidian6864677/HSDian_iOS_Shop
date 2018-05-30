//
//  DLCommonPublic.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/30.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import MJRefresh

func SetPullDownRefresh(vc: UIViewController, selector: Selector, tableView: UITableView) {
    let header = MJRefreshGifHeader(refreshingTarget: vc, refreshingAction: selector)
    let imageArr = NSMutableArray.init()
    for i in 1...2 {
        let loadImage = UIImage(named: "tianyao" + "\(i)")
        imageArr.add(loadImage ?? UIImage())
    }
    let upImg = UIImage(named: "tianyao1")
    let idleImageArr = NSMutableArray()
    idleImageArr.add(upImg ?? UIImage())
    header?.setImages(idleImageArr as! [Any], for: .idle)
    header?.setImages(idleImageArr as! [Any], for: .pulling)
    header?.setImages(imageArr as! [Any], for: .refreshing)
    header?.lastUpdatedTimeLabel.isHidden = true
    header?.stateLabel.isHidden = true
    tableView.mj_header = header
}

