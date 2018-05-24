//
//  Const.swift
//  News
//
//  Created by 杨蒙 on 2017/9/13.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
///Users/dian/Desktop/ios_swift-Demo/testDemo/HSDian_iOS/HSDian_iOS/ChangeFontViewController.swift:52:126: Binary operator '-' cannot be applied to operands of type 'CGFloat' and 'Double'

// MARK:  configure 配置
let BASE_URL = "http://192.168.3.128"

//{() -> UINavigationController in
//    let window =
//    if (_rootNavigationController == nil) {
//        _rootNavigationController = (UINavigationController *)self.xyWindow.rootViewController;
//    }
//    return _rootNavigationController;
//}()
let DLWindow = (UIApplication.shared.delegate as! AppDelegate).window
//{  () -> UIWindow in

//    let rootVC = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController
//     return rootVC.window?.rootViewController
    
//    let appDelegate = UIApplication.shared.delegate?
    
//    return ((appDelegate?.window)!)!
//}()
//UIApplication.shared.delegate?.window
let DLGlobalNavigationController = DLWindow?.rootViewController as! UINavigationController
//    [XYClient defaultClient].rootNavigationController



// MARK: 适配高度
let DLScreenWidth         = UIScreen.main.bounds.width /// 屏幕的宽度
let DLScreenHeight        = UIScreen.main.bounds.height/// 屏幕的高度
let DLScreenRate          = DLScreenWidth/375 as CGFloat            /// 屏幕宽度适配
let DLStatusBarHeight     = UIApplication.shared.statusBarFrame.height /// status高度（电池栏）
let DLTabBarHeight        = (isIPhoneX ? 83.0 : 49.0) as CGFloat     /// TabBar高度
let DLIphoneXBottomHeight = (isIPhoneX ? 34.0 : 0) as CGFloat        /// iPhone X 底部高度
let DLnavigationBarHeight = { () -> CGFloat in          /// Navgation高度
    let nav = UINavigationController()
    let height = nav.navigationBar.frame.size.height
    return height
}()

// MARK: iphone机型判断
let isIPhoneX:  Bool = DLScreenHeight == 812.0 ? true : false
let isIPhone6P: Bool = DLScreenHeight == 736.0 ? true : false
let isIPhone6:  Bool = DLScreenHeight == 667.0 ? true : false
let isIPhone5:  Bool = DLScreenHeight == 568.0 ? true : false
let isIPhone4_or_less: Bool = DLScreenHeight < 568.0 ? true : false


