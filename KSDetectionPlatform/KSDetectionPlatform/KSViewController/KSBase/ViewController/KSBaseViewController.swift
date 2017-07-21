    //
    //  KSBaseViewController.swift
    //  DYPSwift
    //
    //  Created by kris on 2016/11/8.
    //  Copyright © 2016年 kris. All rights reserved.
    //
    
    import UIKit
    
    /// 导航栏有有按钮宽度
    let kNavBtnLeftAndRight_W: CGFloat = 60.0
    /// 导航栏标题按钮宽度
    let kNavBtnTitle_W: CGFloat        = 80.0
    
    class KSBaseViewController: UIViewController, UINavigationControllerDelegate {
        
        var btnTitle: UIButton!
        var btnLeft: UIButton!
        var btnRight: UIButton!
        
        //MARK: - 初始化
        deinit{
            printLog(message: "deinit == \(String(describing: type(of: self)))")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = RGBVCOLOR(0xf8f8f8)
            self.initNavigationBar()
            self.setNavTitleAndBtn()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationController?.delegate = self;
        }
        
        //MARK: - 导航相关
        private func initNavigationBar() {
            //导航栏返回按钮
            let rectLeft  = CGRect(x: 0, y: 0, width: kNavBtnLeftAndRight_W, height: kNavBarHeight)
            btnLeft = self.createBtn(frame: rectLeft)
            btnLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
            btnLeft.addTarget(self, action: #selector(goBackBtnClickHandler(_:)), for: .touchUpInside)
            //导航栏标题按钮
            let rectTitle = CGRect(x: 0, y: 0, width: kNavBtnTitle_W, height: kNavBarHeight)
            btnTitle = self.createBtn(frame: rectTitle)
            btnTitle.titleLabel?.font = KSFont(18)
            btnTitle.addTarget(self, action: #selector(titleBtnClickedHandeler(_:)), for: .touchUpInside)
            //导航栏右边按钮
            let rectRight = CGRect(x: 0, y: 0, width: kNavBtnLeftAndRight_W, height: kNavBarHeight)
            btnRight = self.createBtn(frame: rectRight)
            btnRight.addTarget(self, action: #selector(rightBtnClickedHandeler(_:)), for: .touchUpInside)
            //导航赋值
            self.navigationItem.titleView = btnTitle
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnLeft)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnRight)
        }

        private func createBtn(frame: CGRect) -> UIButton {
            let button = UIButton(frame: frame)
            button.setTitleColor(UIColor.white, for: UIControlState.normal)
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = KSFont(16)
            return button
        }

        //MARK: - 导航栏元素赋值
        func setNavTitleAndBtn() {
            self.setTitleBtn(strTitle: "KSBase", enable: false, imgNor: "", imgSel: "")
            self.setGoBackBtn(strTitle: "", hidden: false, imgNor: "backButton.png", imgSel: "backButton.png")
            self.setRightBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
        }
        
        func setTitleBtn(strTitle: String, enable: Bool, imgNor: String, imgSel: String) {
            if strTitle.isEmpty {
                btnTitle.isEnabled = false
                return;
            }
            btnTitle.setTitle(strTitle, for: .normal)
            btnTitle.setImage(UIImage(named: imgNor), for: .normal)
            btnTitle.setImage(UIImage(named: imgSel), for: .selected)
        }
        
        func setGoBackBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
            if hidden {
                btnLeft.isHidden = true
                return;
            }
            btnLeft.setTitle(strTitle, for: .normal)
            btnLeft.setImage(UIImage(named: imgNor), for: .normal)
            btnLeft.setImage(UIImage(named: imgSel), for: .selected)
            btnLeft.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        }
        
        func setRightBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
            if hidden {
                btnRight.isHidden = true
                return
            }
            btnRight.setTitle(strTitle, for: .normal)
            btnRight.setImage(UIImage(named: imgNor), for: .normal)
            btnRight.setImage(UIImage(named: imgSel), for: .selected)
        }
        
        //MARK: - 导航栏响应函数
        func titleBtnClickedHandeler(_ sender: UIButton) {
            
        }
        func goBackBtnClickHandler(_ sender: UIButton) {
            _ = self.navigationController?.popViewController(animated: true)
            //self.releaseRequestTasks()
        }
        func rightBtnClickedHandeler(_ sender: UIButton ) {
            
        }
        
        //MARK: - 页面点击取消编辑
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
//        func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//            if navigationController is KSNavigationViewController {
//                let coordinator: UIViewControllerTransitionCoordinator? = navigationController.topViewController?.transitionCoordinator
//                if (coordinator != nil && (coordinator?.initiallyInteractive)!) {
//                    coordinator?.notifyWhenInteractionEnds({ (context) in
//                        if (coordinator?.isCancelled)! {
//                            var baseVC: KSBaseViewController!
//                            let fromVC: UIViewController = context.viewController(forKey: UITransitionContextViewControllerKey.from)!
//                            if fromVC is KSBaseViewController{
//                                baseVC = (fromVC as! KSBaseViewController)
//                            } else if (fromVC is DYPTabBarController){
//                                let tabVC: DYPTabBarController = (fromVC as! DYPTabBarController)
//                                baseVC = (tabVC.selectedViewController as! KSBaseViewController)
//                            }
//                            baseVC.releaseRequestTasks()
//                        }
//                    })
//                }
//            }
//        }
//        
//        /**
//         *  统一处理错误码
//         *
//         */
//        func manageErrorStatus(strStatus: String, strMsg: String) {
//            self.stopLoading()
//            if strStatus == "-2" {
//                self.logoutAndClearData()
//                return
//            } else {
//                self.showPrompt(prompt: strMsg)
//            }
//        }
//        
//        /**
//         *  统一处理请求失败
//         *
//         */
//        func manageFailStatus() {
//            self.stopLoading()
//            self.showPrompt(prompt: "网络不给力，请稍后再试")
//        }
//        
//        func logoutAndClearData() {
//            KSGlobal.shareInstance().clearLoginData()
//            
//            let rootVC = self.navigationController?.viewControllers[0]
//            if rootVC is DYPLoginViewController {
//                _ = self.navigationController?.popToRootViewController(animated: true)
//                let loginVC: DYPLoginViewController = rootVC as! DYPLoginViewController
//                loginVC.logOutPopToRoot()
//            } else if rootVC is DYPTabBarController {
//                let loginVC: DYPLoginViewController = DYPLoginViewController()
//                let arrVCs: Array = [loginVC]
//                rootVC?.navigationController?.setViewControllers(arrVCs, animated: true)
//            }
//        }
//        
//        //MARK: - 释放请求
//        private func releaseRequestTasks() {
//            let selCancel: Selector = Selector(kSelectorStruct.cancelRequest)
//            if (viewModel != nil) && (viewModel?.responds(to: selCancel))!  {
//                viewModel?.cancelRequest()
//            }
//        }
        
        
    }
