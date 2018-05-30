//
//  JobModel.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/22.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import ObjectMapper

struct Job: Mappable {
    //频道列表
    var jobArray: [JobModel]?

    init?(map: Map) { }

    // Mappable
    mutating func mapping(map: Map) {
        DLLog(map.JSON)
        jobArray <- map["title"]
    }
}

struct JobModel: Mappable {
    var jobName: String?     /// 工作内容
    var address: String?     /// 工作地点
    var time: String?        /// 工作时间
    var money: String?       /// 价格
    var settlement: String?  /// 结算方式
    var companyIcon: String? /// 公司 logo
    var companyName: String? /// 工作单位
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        jobName     <- map["name"]
        address     <- map["name_en"]
        time        <- map["channel_id"]
        money       <- map["seq_id"]
        settlement  <- map["abbr_en"]
        companyIcon <- map["abbr_en"]
        companyName <- map["abbr_en"]
    }
}









/// 首页顶部图片
struct JobTopImage: Mappable {
    //频道列表
    var imageArray: [JobTopImageModel]?

    init?(map: Map) { }

    // Mappable
    mutating func mapping(map: Map) {
        imageArray <- map["title"]
    }
}

struct JobTopImageModel: Mappable {
    var imageUrl: String?     /// 图片url
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        imageUrl <- map["url"]
    }
}

