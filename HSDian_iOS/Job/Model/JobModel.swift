//
//  JobModel.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/22.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class JobModel: NSObject {
    var jobName: String?     /// 工作内容
    var address: String?     /// 工作地点
    var time: String?        /// 工作时间
    var money: String?       /// 价格
    var settlement: String?  /// 结算方式
    var companyIcon: String? /// 公司 logo
    var companyName: String? /// 工作单位
    
    override convenience init() {
        self.init(info:nil)
    }
    init(info: [String: Any]?) {
        super.init()
        toMoel(info: info  ??  [:])
    }
    
    func toMoel(info:[String: Any]) {
        self.jobName = info["userId"] as? String
        self.address = info["password"] as? String
        self.time = info["phone"] as? String
        self.money = info["userId"] as? String
        self.settlement = info["userId"] as? String
        self.companyIcon = info["userId"] as? String
        self.companyName = info["userId"] as? String
        
    }
}
