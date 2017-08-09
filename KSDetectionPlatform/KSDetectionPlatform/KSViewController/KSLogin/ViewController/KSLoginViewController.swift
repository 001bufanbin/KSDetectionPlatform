//
//  KSLoginViewController.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/7/13.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit
//import KSServiceManager

class KSLoginViewController: KSBaseViewController {

    var loginView: KSLoginView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initContainsView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func setNavTitleAndBtn() {
        self.setGoBackBtn(strTitle: "", hidden: true, imgNor: "backButton.png", imgSel: "backButton.png")
        self.setTitleBtn(strTitle: "登录", enable: false, imgNor: "", imgSel: "")
        self.setRightBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
    }

    func initContainsView() {
        loginView = KSLoginView(frame: CGRect(x: 0, y: 0, width: kAppWidth, height: kAppHeight))
        loginView.loginButton.addTarget(self, action: #selector(btnLoginDidClick(_:)), for: .touchUpInside)
        self.view.addSubview(loginView)
    }
    
    //
    func btnLoginDidClick(_ sender: UIButton) -> Void {
        self.endEdit()
        printLog(HOME_URL)
        let service:KSBaseService = KSBaseService()
        service.getRequest(url: "https://api.androidhive.info/contacts/", success: { (request, jsonData) in
            
        }, failure: { (request)  in
            
        })
        
        return
        let homeVC: KSHomeViewController = KSHomeViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
