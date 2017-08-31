//
//  KSMsgCenterViewController.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/16.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSMsgCenterViewController: KSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setTitleBtn(strTitle: "消息", enable: false, imgNor: "", imgSel: "")
        self.initContainsView()
    }

    override func initContainsView() -> Void {
        self.initBtnGetMsgList()
    }

    private func initBtnGetMsgList() -> Void {
        let rect = CGRect(x: 100, y: 100, width: 200, height: 40)
        let btnGetMsgCount = UIButton(type: .system)
        btnGetMsgCount.frame = rect;
        btnGetMsgCount.backgroundColor = UIColor.red
        btnGetMsgCount.setTitle("获取消息列表", for: .normal)
        btnGetMsgCount.addTarget(self, action: #selector(btnGetMsgListClicked(btn:)), for: .touchUpInside)
        self.view.addSubview(btnGetMsgCount)
    }

    // MARK: - load Request
    private func loadMsgListRequest() -> Void {
        KSSettingViewModel.share.loadMsgList(pageIndex: 1, success: { (request, model) in
            self.hiddenLoad()
            printLog(model.PageIndex)
            printLog(model.PageSize)
            printLog(model.TotalCount)
            printLog(model.List?.first?.TaskID)
            printLog(model.List?.first?.OrderStatus)
            printLog(model.List?.first?.OrderType)
            printLog(model.List?.first?.TaskVersion)
            printLog(model.List?.first?.Content)
            printLog(model.List?.first?.Title)
            printLog(model.List?.first?.ID)
            printLog(model.List?.first?.CreateTime)
        }) { (request, error) in
            self.hiddenLoad()
            self.manageFailStatus()
        }
    }

    // MARK: - btn handler
    func btnGetMsgListClicked(btn: UIButton) -> Void {
        self.showLoad()
        self.loadMsgListRequest()
    }
    
    
}
