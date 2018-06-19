//
//  LDSendRecruitViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/19.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
private let SendRecruitTableViewCellIdentifier = "SendRecruitTableViewCell_Identifier";

class LDSendRecruitViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLeftNavigationBackItem()
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
        tableView.separatorStyle = .none
        tableView.register(SendRecruitTableViewCell.self, forCellReuseIdentifier: SendRecruitTableViewCellIdentifier)
        return tableView
    }()

}

extension LDSendRecruitViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SendRecruitTableViewCell = tableView.dequeueReusableCell(withIdentifier: SendRecruitTableViewCellIdentifier, for: indexPath) as! SendRecruitTableViewCell
        cell.textLabel?.text = "1111";
        return cell
    }
    
}

