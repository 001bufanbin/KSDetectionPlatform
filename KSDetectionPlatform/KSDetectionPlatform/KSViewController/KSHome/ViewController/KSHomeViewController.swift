//
//  KSHomeViewController.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/7/19.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSHomeViewController: KSBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setNavTitleAndBtn() {
        self.setGoBackBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
        self.setTitleBtn(strTitle: "主页", enable: false, imgNor: "", imgSel: "")
        self.setRightBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
    }
    
}
