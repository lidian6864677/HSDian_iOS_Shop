//
//  NetworkHomeApi.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/27.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import Moya
import RxSwift
private let URL_HEADER_IMAGE_HOME = "/url/all"  /// 首页顶部轮播图 url
private let URL_JOB_LIST = "/url/all"  /// 首页顶部轮播图 url
        
//初始化豆瓣FM请求的provider
let GetNetworkJobData = MoyaProvider<NetworkHomeApi>()

/** 下面定义豆瓣FM请求的endpoints（供provider使用）**/
//请求分类
public enum NetworkHomeApi {
    case GetHomeTopImage // 获取首页列表
    case GetJobList // 获取首页招聘信息列表
    case GetChannels // 获取首页列表
//    case playlist(String) //获取歌曲
}

//请求配置
extension NetworkHomeApi: TargetType {
    //服务器地址
    public var baseURL: URL {
        switch self {
        case .GetChannels  :
            return URL(string: "https://www.douban.com")!
//            https://www.douban.com/j/app/radio/channels
        default:
            return URL(string: BASE_URL_Test)!
            
//        case .playlist(_):
//            return URL(string: "https://douban.fm")!
        }
    }
    
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .GetHomeTopImage:
            return URL_HEADER_IMAGE_HOME
        case .GetJobList:
            return URL_JOB_LIST
        case .GetChannels:
            return "/j/app/radio/channels"
        }
    }
    
    //请求类型
    public var method: Moya.Method {
        return .get
    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
//        case .playlist(let channel):
//            var params: [String: Any] = [:]
//            params["channel"] = channel
//            params["type"] = "n"
//            params["from"] = "mainsite"
//            return .requestParameters(parameters: params,
//                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    //请求头
    public var headers: [String: String]? {
        return nil
    }
}

