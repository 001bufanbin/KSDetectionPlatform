//
//  KSLoginViewController.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/7/13.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSLoginViewController: KSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initContainsView()
        
    }
    
    override func setNavTitleAndBtn() {
        self.setTitleBtn(strTitle: "登录", enable: false, imgNor: "", imgSel: "")
        self.setGoBackBtn(strTitle: "", hidden: true, imgNor: "backButton.png", imgSel: "backButton.png")
        self.setRightBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
    }

    func initContainsView() {
        let btnLogin = UIButton(frame: CGRect(x: 10, y: 44+20+40, width: 60, height: 40))
        btnLogin.backgroundColor = UIColor.yellow
        btnLogin.setTitleColor(UIColor.black, for: .normal)
        btnLogin.setTitle("登录", for: .normal)
        
        btnLogin.addTarget(self, action:#selector(handlerBtnLogin(_:)) , for: .touchUpInside)
        
        self.view.addSubview(btnLogin)
    }
    
    func handlerBtnLogin(_ btn: UIButton) -> Void {
        printLog(message: "login btn Clicked")
        let homeVC = KSHomeViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
