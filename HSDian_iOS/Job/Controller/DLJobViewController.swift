//
//  DLJobViewController.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/10.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import RxSwift
import RxCocoa
import ObjectMapper
private let DLJobTableViewCellIdentifier = "DLJobTableViewCell_Identifier"
class DLJobViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, CycleViewDelegate {
//    let model = JobModel(map: )
    let disposeBag = DisposeBag()
    let viewModel  = DLJobViewModel()
//    private lazy var jobModelArray: [JobModel] = [JobModel](repeating: model, count: 15)
//    private lazy var jobModelArray: [JobModel] = [model,model]
    private lazy var dataArray:  [JobModel] = []
    private lazy var topImageArray:  [String] = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
    // MARK: GetData
    func getData() {
        viewModel.getTopImage().subscribe(onNext: { (array) in
            DLLog(array.count)
            for model in array{
                self.topImageArray.append(model.imageUrl ?? "")
            }
            self.view.addSubview(self.tableView)
            self.view.addSubview(self.topNavView)
            self.tableHeaderView.imageURLStringArr = self.topImageArray
            
        }, onError: { (error) in
            DLLog(error)
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: disposeBag)
        
        
//        GetNetworkJobData.rx.request(.GetHomeTopImage).mapJSON().subscribe(onSuccess: { (response) in
////            let str = String(data: (response as AnyObject).data, encoding: String.Encoding.utf8)
////            DLLog("返回的数据是:\(str!)")
////            数据处理
//            if let json = response as? [String: Any],
//                let imageArray = json["title"] as? [[String: Any]] {
//                for dict:[String: Any] in imageArray{
//                    self.topImageArray.append(dict["url"] as! String)
//                }
//                DLLog("--- 请求成功！返回的如下数据 ---")
//                DLLog(json)
//            }else{
//
//            }
//
//            self.view.addSubview(self.tableView)
//            self.view.addSubview(self.topNavView)
//            self.tableHeaderView.imageURLStringArr = self.topImageArray
//            //本地图片测试--加载网络图片,请用第三方库如SDWebImage等
////            tableHeaderView.imageURLStringArr = ["home_top_image_001.jpg", "home_top_image_002.jpg", "home_top_image_003.jpg", "home_top_image_004.jpg"]
//
////            let json = response as! [String: Any]
////            for dict:[String: Any] in json["title"] as! NSArray{
////                dataArray.append(dict["url"])
////            }
//
//
//        }) { (error) in
//             print("数据请求失败!错误原因：", error)
//        }.disposed(by: disposeBag)
        
    }
    
    // MARK: GUIs
    lazy var tableView:UITableView = {
        //        let tableViewY:CGFloat = DLStatusBarHeight + DLnavigationBarHeight
        var tableView = UITableView(frame: CGRect(x: 0, y:0 , width: DLScreenWidth, height: DLScreenHeight - DLTabBarHeight), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
        //        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.separatorStyle = .none
        tableView.register(DLJobTableViewCell.self, forCellReuseIdentifier: DLJobTableViewCellIdentifier)
        tableView.tableHeaderView = tableHeaderView
        return tableView
    }()
    /// tableViewHeaderView
    lazy var tableHeaderView: CycleView = {
        let topView = CycleView(frame: CGRect(x: 0, y: 0, width: DLScreenWidth, height: 250*DLScreenRate))
        topView.delegate = self
        topView.mode = .scaleAspectFill
        return topView
    }()
    /// job NavView
    lazy var topNavView: DLJobNavView = {
        let topView = DLJobNavView(frame: CGRect(x: 0, y: 0, width:DLScreenWidth, height: DLStatusBarHeight+DLnavigationBarHeight), canEdit: false)
        return topView
    }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK:
extension DLJobViewController {
}
// MARK: scrollViewDelegate
extension DLJobViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        if scrollView.contentOffset.y < -40 && self.topNavView.isHidden == false{
            self.topNavView.isHidden = true
        }else if scrollView.contentOffset.y > -33 && self.topNavView.isHidden == true{
            self.topNavView.isHidden = false
        }
        
        if scrollView.contentOffset.y < 0 {
            self.topNavView.offsetY = 0
        }else if scrollView.contentOffset.y < (DLStatusBarHeight + DLnavigationBarHeight){
            self.topNavView.offsetY = offsetY
        }else{
            self.topNavView.offsetY = (DLStatusBarHeight + DLnavigationBarHeight)
        }
    }
}


//MARK: CycleViewDelegate
extension DLJobViewController {
    func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
        let demoVc = JobDetailViewController()
        demoVc.title = "点击了轮播图第\(index)个图片"
        DLGlobalNavigationController.pushViewController(demoVc, animated: true)
    }
}


// MARK: tableViewDelegate&tableViewDatasource
extension DLJobViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return jobModelArray.count
        return 15
//        return dataArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return  UIView(frame: .zero)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return  UIView(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:  DLJobTableViewCell = tableView.dequeueReusableCell(withIdentifier: DLJobTableViewCellIdentifier, for: indexPath) as! DLJobTableViewCell
        cell.updateJobModel(jobModel: nil)
//        cell.updateJobModel(jobModel: dataArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let jobVc = JobDetailViewController()
        DLGlobalNavigationController.pushViewController(jobVc, animated: true)
    }
}


