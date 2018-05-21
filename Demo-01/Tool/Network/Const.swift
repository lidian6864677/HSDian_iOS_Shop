//
//  Const.swift
//  News
//
//  Created by 杨蒙 on 2017/9/13.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
///Users/dian/Desktop/ios_swift-Demo/testDemo/Demo-01/Demo-01/ChangeFontViewController.swift:52:126: Binary operator '-' cannot be applied to operands of type 'CGFloat' and 'Double'

// MARK:  configure 配置
let BASE_URL = "http://192.168.3.128"



// MARK: 适配高度
let screenWidth         = UIScreen.main.bounds.width /// 屏幕的宽度
let screenHeight        = UIScreen.main.bounds.height/// 屏幕的高度
let screenRate          = screenWidth/375 as CGFloat            /// 屏幕宽度适配
let statusBarHeight     = UIApplication.shared.statusBarFrame.height /// status高度（电池栏）
let tabBarHeight        = (isIPhoneX ? 83.0 : 49.0) as CGFloat     /// TabBar高度
let iphoneXBottomHeight = (isIPhoneX ? 34.0 : 0) as CGFloat        /// iPhone X 底部高度
let navigationBarHeight = { () -> CGFloat in          /// Navgation高度
    let nav = UINavigationController()
    let height = nav.navigationBar.frame.size.height
    return height
}()

// MARK: iphone机型判断
let isIPhoneX:  Bool = screenHeight == 812.0 ? true : false
let isIPhone6P: Bool = screenHeight == 736.0 ? true : false
let isIPhone6:  Bool = screenHeight == 667.0 ? true : false
let isIPhone5:  Bool = screenHeight == 568.0 ? true : false
let isIPhone4_or_less: Bool = screenHeight < 568.0 ? true : false


