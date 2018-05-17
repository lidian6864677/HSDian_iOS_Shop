//
//  BaseTabBarViewController.swift
//  Demo-01
//
//  Created by Dian on 2018/5/16.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        
        setUpTabBar()
        
        setChildVc()
        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func setUpTabBar(){
//        let rect = CGRect(x:0,y:0,width:screenWidth,height:0.5)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()!
//        context.setFillColor(UIColor.red.cgColor)
//        context.fill(rect)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        
        //这两个很主要缺一不可
//        self.tabBar.shadowImage = image
        self.tabBar.backgroundImage = UIImage()
        
        // 设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -3.0)
        
//        UITabBarItem.appearance().image
        
        //tabBar 底部工具栏背景颜色 (以下两个都行)
        //self.tabBar.barTintColor = UIColor.orange
        self.tabBar.backgroundColor = UIColor.white
        
        //设置 tabBar 工具栏字体颜色 (未选中  和  选中)
        //未选中
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.4078176022, green: 0.407827884, blue: 0.4078223705, alpha: 1),
                                                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 11)], for: .selected)
        //选中
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
                                                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 11)], for: .normal)
        
        // 设置图片选中时颜色必须设置（系统默认选中蓝色）
        UITabBar.appearance().tintColor = UIColor.black
        //或者写法都是一样的
        //self.tabBar.tintColor = UIColor.black
        
    }
    fileprivate func setChildVc(){
        prepareChildViewController(ViewController(), title: "心动", normalImage: "TabBar0_new", selectedImage: "TabBar0_new_hover")
        prepareChildViewController(ChangeFontViewController(), title: "消息", normalImage: "TabBar1_new", selectedImage: "TabBar1_new_hover")
        
//        prepareChildViewController(ChangeFontViewController(), title: "", normalImage: "TabBar4_new_hover", selectedImage: "TabBar4_new_hover")
        
        prepareChildViewController(Vc3ViewController(), title: "主页", normalImage: "TabBar2_new", selectedImage: "TabBar2_new_hover")
        prepareChildViewController(Vc4ViewController(), title: "我的", normalImage: "TabBar3_new", selectedImage: "TabBar3_new_hover")
    }
    

    fileprivate func prepareChildViewController(_ vc:UIViewController,title:String, normalImage:String, selectedImage:String){
        vc.title = title
//        vc.tabBarItem.image = UIImage(named:normalImage)?
        vc.tabBarItem.image = UIImage(named:normalImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named:selectedImage)?.withRenderingMode(.alwaysOriginal)
        /// 更改 Tabbar的图片大小  top 和 bottom 一定要这只为相反数 否则 image大小会一直变化
        if title.isEmpty {
            vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
        let baseNav = BaseNavgationController(rootViewController:vc)
        addChildViewController(baseNav)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
