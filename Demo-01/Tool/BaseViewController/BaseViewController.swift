//
//  BaseViewController.swift
//  Demo-01
//
//  Created by Dian on 2018/5/11.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///  返回按钮
    func setLeftNavigationBackItem(){
        let leftButton:UIButton = UIButton(type: UIButtonType.custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        leftButton.contentHorizontalAlignment = .left
        leftButton.setImage(UIImage(named: "back_image"), for: UIControlState.normal)
        leftButton.addTarget(self, action: #selector(clickedLeftNavigationItem), for: UIControlEvents.touchUpInside)
    }
    
    /// 右侧Nav按钮 文字  类型
    ///
    /// - Parameter title: 名字
    func setRightNavgationItemWithTitle(title:String){
        self.setRightNavgationItem(title: title, image: nil)
    }
    
    /// 右侧Nav按钮 图片 类型
    ///
    /// - Parameter image: image
    func setRightNavgationItemWithImage(image:UIImage){
        self.setRightNavgationItem(title: nil, image: image)
    }
    private func setRightNavgationItem(title:String?, image:UIImage?){
        let rightButton:UIButton = UIButton(type: .custom)
        if let title = title{
            let length = title.count
            rightButton.frame = CGRect(x: 0, y: 0, width: 15*length, height: 44)
            rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            rightButton.setTitle(title, for: .normal)
            rightButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        }
        if let image = image {
            rightButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
            rightButton.setImage(image, for: .normal)
        }
        rightButton.contentHorizontalAlignment = .right
        rightButton.addTarget(self, action: #selector(clickRightNavgationItem), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    @objc func clickRightNavgationItem() {
        print("   ")
    }
    @objc func clickedLeftNavigationItem(){
        if (self.presentingViewController != nil) {
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
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

