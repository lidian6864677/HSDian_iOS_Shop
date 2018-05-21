//
//  Observable+ObjectMapper.swift
//  Demo-01
//
//  Created by Dian on 2018/5/19.
//  Copyright © 2018年 Dian. All rights reserved.
//
//import Foundation
//import RxSwift
//import Moya
//import ObjectMapper
//import SwiftyJSON
//
//extension Response {
//    public func mapObject<T: BaseMappable>(_ type: T.Type) throws -> T {
//        guard let object = Mapper<T>().map(JSONObject: try mapJSON()) else {
//            throw MoyaError.jsonMapping(self)
//        }
//        return object
//    }
//
//    public func mapArray<T: BaseMappable>(_ type: T.Type) throws -> [T] {
//        let json = JSON(data: self.data)
//        let jsonArray = json["data"]["data"]
//
//        guard let array = jsonArray.arrayObject as? [[String: Any]],
//            let objects = Mapper<T>().mapArray(JSONArray: array) else {
//                throw MoyaError.jsonMapping(self)
//        }
//        return objects
//    }
//}
//
//extension ObservableType where E == Response {
//    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
//        return flatMap { response -> Observable<T> in
//            return Observable.just(try response.mapObject(T.self))
//        }
//    }
//
//    public func mapArray<T: BaseMappable>(_ type: T.Type) -> Observable<[T]> {
//        return flatMap { response -> Observable<[T]> in
//            return Observable.just(try response.mapArray(T.self))
//        }
//    }
//
//}

