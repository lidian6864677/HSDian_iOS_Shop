//
//  DLJobViewController.swift
//  Demo-01
//
//  Created by Dian on 2018/5/10.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import Moya
private let DLJobTableViewCellIdentifier = "DLJobTableViewCell_Identifier"
class DLJobViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    let model  = JobModel()
    
    private lazy var jobModelArray: [JobModel] = [JobModel](repeating: model, count: 15)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.view.addSubview(topNavView)
        self.navigationItem.title = "refersh"
        
        self.setRightNavgationItemWithTitle(title: "Change")
        getData()
    }
  
    
    func getData() {
//        DouBanProvider.request(.channels) { (result) in
//            if case let .success(response) = result {
//                //解析数据
////                let data = try? response.mapJSON()
////                let json = JSON(data!)
////                self.channels = json["channels"].arrayValue
//                //刷新表格数据
//                DispatchQueue.main.async{
//                    self.tableView.reloadData()
//                }
//            }
//
//        }
    }
    
    
    
    
    
    
    
    override func clickRightNavgationItem() {
        print("更改了文字")
        getData()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if scrollView.contentOffset.y < 0 {
            self.topNavView.offsetY = 0
        }else if scrollView.contentOffset.y < (DLStatusBarHeight + DLnavigationBarHeight){
            self.topNavView.offsetY = offsetY
        }else{
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobModelArray.count
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
        cell .updateJobModel(jobModel: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let jobVc = JobDetailViewController()
        self.navigationController?.pushViewController(jobVc, animated: true)
//        DLGlobalNavigationController?.pushViewController(jobVc, animated: true)
    }
    
    
    func random(lower: Int = 0, _ upper: Int = Int.max) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
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
    lazy var tableHeaderView: DLJobTableViewHeaderView = {
        let topView = DLJobTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: DLScreenWidth, height: 200))
        return topView
    }()
    /// job NavView
    lazy var topNavView: DLJobNavView = {
        let topView = DLJobNavView(frame: CGRect(x: 0, y: 0, width:DLScreenWidth, height: DLStatusBarHeight+DLnavigationBarHeight))
        return topView
    }()
    

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
