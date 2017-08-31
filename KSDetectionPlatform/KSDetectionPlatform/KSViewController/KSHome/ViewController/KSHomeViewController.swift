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
        self.view.backgroundColor = UIColor.green

        // Do any additional setup after loading the view.
        self.initContainsView()
    }

    // MARK: - init contains view
    override func initContainsView() -> Void {
        self.initNavView()
        self.initBtnRefresh()
        self.initBtnPicSample()
    }

    private func initNavView() -> Void {
        let rect = CGRect(x: 0, y: 0, width: kAppWidth, height: kStatusBarHeight+kNavBarHeight)
        let navView:KSNavCustomView = KSNavCustomView(frame: rect)
        navView.setGoBackBtn(strTitle: "", hidden: false, imgNor: "JZGOffice_Home_BtnSet.png", imgSel: "ZGOffice_Home_BtnSet.png")
        navView.setTitleBtn(strTitle: "", enable: true, imgNor: "", imgSel: "")
        navView.setRightBtn(strTitle: "", hidden: false, imgNor: "JZGOffice_Home_BtnMsg.png", imgSel: "JZGOffice_Home_BtnMsg.png")
        navView.btnLeft.addTarget(self, action: #selector(goBackBtnClickHandler(_:)), for: .touchUpInside)
        navView.btnTitle.addTarget(self, action: #selector(titleBtnClickedHandeler(_:)), for: .touchUpInside)
        navView.btnRight.addTarget(self, action: #selector(rightBtnClickedHandeler(_:)), for: .touchUpInside)
        self.view.addSubview(navView)
    }


    private func initBtnRefresh() -> Void {
        let rect = CGRect(x: 100, y: 100, width: 200, height: 40)
        let btnRefresh = UIButton(type: .system)
        btnRefresh.frame = rect;
        btnRefresh.backgroundColor = UIColor.red
        btnRefresh.setTitle("获取主页信息", for: .normal)
        btnRefresh.addTarget(self, action: #selector(btnRefreshClicked(btn:)), for: .touchUpInside)
        self.view.addSubview(btnRefresh)
    }

    private func initBtnPicSample() -> Void {
        let rect = CGRect(x: 100, y: 200, width: 200, height: 40)
        let btnPicSample = UIButton(type: .system)
        btnPicSample.frame = rect;
        btnPicSample.backgroundColor = UIColor.red
        btnPicSample.setTitle("获取拍摄样例", for: .normal)
        btnPicSample.addTarget(self, action: #selector(btnLoadPicSampleClicked(btn:)), for: .touchUpInside)
        self.view.addSubview(btnPicSample)
    }

    // MARK: - load Request
    private func loadHomeInfoRequest() -> Void {
        KSHomeViewModel.share.loadHomeInfo(success: { (request, model) in
            self.hiddenLoad()
            printLog(model.TaskCount)
            printLog(model.Banner)
            printLog(model.Statistic)
        }) { (request, error) in
            self.hiddenLoad()
            self.manageFailStatus()
        }
    }

    private func loadPicSample() -> Void {
        KSHomeViewModel.share.loadHomePicSample(success: { (request, model) in
            self.hiddenLoad()
            printLog(model.KSList)
            printLog(model.KSList?.first?.ID)
            printLog(model.KSList?.first?.Description)
            printLog(model.KSList?.first?.Title)
            printLog(model.KSList?.first?.PictureUrl)
        }) { (request, error) in
            self.hiddenLoad()
            self.manageFailStatus()
        }
    }

    // MARK: - btn handler
    func btnRefreshClicked(btn: UIButton) -> Void {
        self.showLoad()
        self.loadHomeInfoRequest()
    }

    func btnLoadPicSampleClicked(btn: UIButton) -> Void {
        self.showLoad()
        self.loadPicSample()
    }

    override func goBackBtnClickHandler(_ sender: UIButton) {
        let settingVC = KSSettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }

    override func rightBtnClickedHandeler(_ sender: UIButton) {
        let msgCenterVC = KSMsgCenterViewController()
        self.navigationController?.pushViewController(msgCenterVC, animated: true)
    }
    
}
