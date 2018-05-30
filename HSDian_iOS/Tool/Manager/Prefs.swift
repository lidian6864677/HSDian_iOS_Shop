//
//  Prefs.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/30.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import RxSwift
import RxCocoa
class Prefs: NSObject {
    static let sharePrefs = Prefs()
    func getTopBannerImage() {
        let viewModel  = DLJobViewModel()
        let disposeBag = DisposeBag()
        var topImageArray:  [String] = []
        viewModel.getTopImage().subscribe { (event) in
            switch event{
            case .next(let models):
                for model in models{
                    topImageArray.append(model.imageUrl ?? "")
                }
                if topImageArray.count > 0{
                    /// 请求成功更新本地
                    DLUserDefaults.shareDLUserDefaults.setDefaultsArray(key: UserDefaults_Top_image_Banner, saveArray: topImageArray)
                }
//                else{
//                    /// 请求失败使用本地存储的
//                    topImageArray = DLUserDefaults.shareDLUserDefaults.getDefaultsArray(key: UserDefaults_Top_image_Banner) as! [String]
//                }
//                self.tableHeaderView.imageURLStringArr = self.topImageArray
            case .error(let error):
                NetworkHomeApi.errorMessage(error: error as! MoyaError)
            case .completed:
                return
            }
            }.disposed(by: disposeBag)
    }
}
