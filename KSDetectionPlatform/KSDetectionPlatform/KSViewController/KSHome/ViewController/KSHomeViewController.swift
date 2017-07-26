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
        self.initContainsView()
        
    }

    override func setNavTitleAndBtn() {
        self.setGoBackBtn(strTitle: "", hidden: false, imgNor: "backButton.png", imgSel: "backButton.png")
        self.setTitleBtn(strTitle: "主页", enable: false, imgNor: "", imgSel: "")
        self.setRightBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
    }
    
    func initContainsView() -> Void {
        let rectBtn = CGRect(x: 40, y: 80, width: 40, height: 40)
        let btn: UIButton = UIButton(frame: rectBtn)
        btn.backgroundColor = UIColor.red
        btn.setTitle("设置", for: .normal)
        btn.addTarget(self, action: #selector(btnToSetting(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    func btnToSetting(_ btn: UIButton) -> Void {
        let settingVC = KSSettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
}
