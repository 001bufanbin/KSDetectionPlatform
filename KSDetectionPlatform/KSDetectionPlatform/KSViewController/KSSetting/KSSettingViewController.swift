//
//  KSSettingViewController.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/7/26.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSSettingViewController: KSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setTitleBtn(strTitle: "设置", enable: false, imgNor: "", imgSel: "")
        self.setRightBtn(strTitle: "", hidden: false, imgNor: "JZGOffice_Home_BtnMsg.png", imgSel: "JZGOffice_Home_BtnMsg.png")

        self.initContainsView()
    }

    override func initContainsView() -> Void {
        self.initBtnGetMsgCount()
    }

    private func initBtnGetMsgCount() -> Void {
        let rect = CGRect(x: 100, y: 100, width: 200, height: 40)
        let btnGetMsgCount = UIButton(type: .system)
        btnGetMsgCount.frame = rect;
        btnGetMsgCount.backgroundColor = UIColor.red
        btnGetMsgCount.setTitle("获取消息数量", for: .normal)
        btnGetMsgCount.addTarget(self, action: #selector(btnGetMsgCountClicked(btn:)), for: .touchUpInside)
        self.view.addSubview(btnGetMsgCount)
    }

    // MARK: - load Request
    private func loadMsgCountRequest() -> Void {
        KSSettingViewModel.share.loadMsgCount(success: { (request, model) in
            self.hiddenLoad()
            
        }) { (request, error) in
            self.hiddenLoad()
            self.manageFailStatus()
        }
    }

    // MARK: - btn handler
    func btnGetMsgCountClicked(btn: UIButton) -> Void {
        self.showLoad()
        self.loadMsgCountRequest()
    }

    override func rightBtnClickedHandeler(_ sender: UIButton) {
        let msgCenterVC = KSMsgCenterViewController()
        self.navigationController?.pushViewController(msgCenterVC, animated: true)
    }
}
