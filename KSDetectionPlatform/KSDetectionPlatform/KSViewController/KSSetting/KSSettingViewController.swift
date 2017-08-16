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
    }
    
//    override func setNavTitleAndBtn() {
//        super.setNavTitleAndBtn()
//        
//    }

    func initContainsView() -> Void {
        
    }

    override func rightBtnClickedHandeler(_ sender: UIButton) {
        let msgCenterVC = KSMsgCenterViewController()
        self.navigationController?.pushViewController(msgCenterVC, animated: true)
    }
}
