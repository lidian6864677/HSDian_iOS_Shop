//
//  ChangeFontViewController.swift
//  Demo-01
//
//  Created by Dian on 2018/5/10.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import SwiftyJSON
import Moya

class ChangeFontViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    
    var channels:[JSON] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.navigationItem.title = "refersh"
        self.setRightNavgationItemWithTitle(title: "Change")
        getData()
    }
    
    
    func getData() {
        DouBanProvider.request(.channels) { (result) in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                self.channels = json["channels"].arrayValue
                //刷新表格数据
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    
    
    
    
    
    
    override func clickRightNavgationItem() {
        print("更改了文字")
        getData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewIndetifer", for: indexPath)
        cell.textLabel?.text = channels[indexPath.row]["name"].stringValue
        return cell
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
    
    
    lazy var tableView:UITableView = {
        
        let tableViewY:CGFloat = statusBarHeight + navigationBarHeight
        let tab = tabBarHeight
        var tableView = UITableView(frame: CGRect(x: 0, y:tableViewY , width: screenWidth, height: screenHeight - tableViewY - tabBarHeight), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
            
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableviewIndetifer")
        return tableView
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
