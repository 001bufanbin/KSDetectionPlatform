    //
    //  KSBaseViewController.swift
    //  DYPSwift
    //
    //  Created by kris on 2016/11/8.
    //  Copyright © 2016年 kris. All rights reserved.
    //
    
    import UIKit
    
    class KSBaseViewController: UIViewController, UINavigationControllerDelegate {
        
        struct kSelectorStruct {
            static let titleHandler  = "titleBtnClickedHandeler:"
            static let goBackHandler = "goBackBtnClickHandler:"
            static let rightHandler  = "rightBtnClickedHandeler:"
            static let cancelRequest = "cancelRequest"
        }
        struct kFrameStruct {
            static let navLeftAndRightBtn_W: CGFloat = 60.0
            static let navTitleBtn_W: CGFloat        = 80.0
        }
        
        var btnTitle: UIButton!
        var btnLeft: UIButton!
        var btnRight: UIButton!
        var textField: UITextField?
//        var hud: ATMHud?
//        var loadingView: DYPLoadingView?
//        var emptyView: DYPEmptyView?
//        
        var dicSource: NSMutableDictionary?
//        var viewModel: KSBaseViewModel?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = RGBVCOLOR(0xf8f8f8)
            self.initNavigationBar()
            self.setNavTitleAndBtn()
            // Do any additional setup after loading the view.
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationController?.delegate = self;
        }
        
        //MARK: - 导航相关
        private func initNavigationBar() {
            self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationItem.hidesBackButton = true
            //导航栏按钮初始化
            let rectLeft = CGRect(x: 0, y: 0, width: kFrameStruct.navLeftAndRightBtn_W, height: kNaviBarHeight)
            let rectTitle = CGRect(x: 0, y: 0, width: kFrameStruct.navTitleBtn_W, height: kNaviBarHeight)
            let rectRight = CGRect(x: 0, y: 0, width: kFrameStruct.navLeftAndRightBtn_W, height: kNaviBarHeight)
            btnLeft = UIButton(frame: rectLeft)
            btnLeft.backgroundColor = UIColor.red
            btnRight = UIButton(frame: rectRight)
            btnTitle = UIButton(frame: rectTitle)
            //设置响应函数
            self.setNavBtnCommonStyle(btnNav: btnLeft)
            self.setNavBtnCommonStyle(btnNav: btnRight)
            self.setNavBtnCommonStyle(btnNav: btnTitle)
            
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            self.navigationController?.hidesBarsOnTap = false
        }

        private func setNavBtnCommonStyle(btnNav:UIButton) {
            btnNav.setTitleColor(UIColor.white, for: UIControlState.normal)
            btnNav.titleLabel?.textAlignment = NSTextAlignment.center
            //btnNav.titleLabel?.font = KSTools.setFont(14);
            
            let navBtnClicedHandler: Selector
            if btnNav == btnTitle {
                navBtnClicedHandler = Selector(kSelectorStruct.titleHandler)
            } else if btnNav == btnLeft {
                navBtnClicedHandler = Selector(kSelectorStruct.goBackHandler)
            } else if btnNav == btnRight {
                navBtnClicedHandler = Selector(kSelectorStruct.rightHandler)
            } else {
                return;
            }
            if self.responds(to: navBtnClicedHandler) {
                btnNav.addTarget(self, action: navBtnClicedHandler, for: UIControlEvents.touchUpInside)
            }
        }

        /**
         *  导航赋值
         *
         */
        func setNavTitleAndBtn() {
            self.setTitleBtn(strTitle: "KSBase", enable: false, imgNor: "", imgSel: "")
            self.setGoBackBtn(strTitle: "返回", hidden: false, imgNor: "backButton.png", imgSel: "backButton.png")
            self.setRightBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
        }
        
        func setTitleBtn(strTitle: String, enable: Bool, imgNor: String, imgSel: String) {
            textField?.isHidden = true;
            if strTitle.isEmpty {
                return;
            }
            btnTitle.setTitle(strTitle, for: UIControlState.normal)
            btnTitle.setImage(UIImage(named: imgNor), for: UIControlState.normal)
            btnTitle.setImage(UIImage(named: imgSel), for: UIControlState.selected)
            btnTitle.isUserInteractionEnabled = true
            
            if (self.tabBarController != nil) {
                self.tabBarController?.navigationItem.titleView = btnTitle
            } else {
                self.navigationItem.titleView = btnTitle
            }
        }
        
        func setGoBackBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
            btnLeft.isHidden = hidden
            if (self.tabBarController != nil) {
                self.tabBarController?.navigationItem.leftBarButtonItem?.customView?.isHidden = true
            } else {
                self.navigationItem.leftBarButtonItem?.customView?.isHidden = hidden
            }
            if hidden {
                return;
            }
            
            btnLeft.setTitle(strTitle, for: UIControlState.normal)
            btnLeft.setImage(UIImage(named: imgNor), for: UIControlState.normal)
            btnLeft.setImage(UIImage(named: imgSel), for: UIControlState.selected)
            btnLeft.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
            btnLeft.titleLabel?.textAlignment = NSTextAlignment.center
            
            //处理tabbarcontroller下导航
            if (self.tabBarController != nil) {
                if ((self.tabBarController?.navigationItem.leftBarButtonItem) != nil) {
                    self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnLeft)
                } else {
                    self.tabBarController?.navigationItem.leftBarButtonItem?.customView = btnLeft
                }
            } else {
                if (self.navigationItem.leftBarButtonItem != nil) {
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnLeft)
                } else {
                    self.navigationItem.leftBarButtonItem?.customView = btnLeft
                }
            }
        }
        
        func setRightBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
            btnRight.isHidden = hidden
            if (self.tabBarController != nil) {
                if (self.tabBarController?.navigationItem.rightBarButtonItem != nil) {
                    self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnRight)
                } else {
                    self.tabBarController?.navigationItem.rightBarButtonItem?.customView = btnRight
                }
            } else {
                if (self.navigationItem.rightBarButtonItem != nil) {
                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnRight)
                } else {
                    self.navigationItem.rightBarButtonItem?.customView = btnRight
                }
            }
        }
        
        /**
         *  导航栏响应函数
         *
         */
        func titleBtnClickedHandeler(sender: AnyObject) {
            
        }
        func goBackBtnClickHandler(sender: AnyObject) {
            _ = self.navigationController?.popViewController(animated: true)
            self.releaseRequestTasks()
        }
        func rightBtnClickedHandeler(sender: AnyObject) {
            
        }
//
//        //MARK: - TabBar
//        func popToTabBarIndex(index: DYPTabBarIndex, dicTemp: NSMutableDictionary) -> KSBaseViewController {
//            var isContainVC: Bool = false
//            var tabVC: DYPTabBarController!
//            var baseVC: KSBaseViewController!
//            
//            for viewController: UIViewController in (self.navigationController?.viewControllers)! {
//                if viewController is DYPTabBarController {
//                    isContainVC = true
//                    tabVC = (viewController as? DYPTabBarController)!
//                    tabVC.selectedIndex = index.rawValue
//                    baseVC = (tabVC.selectedViewController as? KSBaseViewController)!
//                    baseVC.dicSource = dicTemp
//                    _ = self.navigationController?.popViewController(animated: false)
//                    break
//                }
//            }
//            if (isContainVC == false) {
//                tabVC = DYPTabBarController()
//                tabVC.setTabViewControllers()
//                tabVC.selectedIndex = index.rawValue
//                baseVC = tabVC.selectedViewController as! KSBaseViewController
//                baseVC.dicSource = dicTemp
//                self.navigationController?.pushViewController(tabVC, animated: true)
//            }
//            return baseVC
//        }
//        
//        func setTabBarIndex(index: NSInteger, count: String) {
//            for viewController: UIViewController in (self.navigationController?.viewControllers)! {
//                if viewController is DYPTabBarController {
//                    let tabVC: DYPTabBarController = (viewController as! DYPTabBarController)
//                    tabVC.tabBar.setIndex(index, badgeValue: count)
//                }
//            }
//        }
//        
//        //MARK: - 展示用户提示相关
//        private func initWeakHud() {
//            if (hud != nil) {
//                return
//            }
//            hud = ATMHud(delegate: nil)
//            self.view.addSubview((hud?.view)!)
//        }
//        /**
//         *  弱提示
//         *
//         */
//        func showPrompt(prompt: String) {
//            self.showPrompt(prompt: prompt, seconds: 1.0)
//        }
//        func showPrompt(prompt: String, seconds: Float) {
//            DispatchQueue.global().async {
//                self.initWeakHud()
//                DispatchQueue.main.async {
//                    self.view.bringSubview(toFront: (self.hud?.view)!)
//                    self.hud?.setCaption(prompt)
//                    self.hud?.show()
//                    self.hud?.hide(after: TimeInterval(seconds))
//                }
//            }
//        }
//        
//        private func initLoadingView() {
//            if loadingView != nil {
//                return
//            }
//            let rectLoading: CGRect = CGRect(x: 0, y: 0, width: kAppWidth, height: kAppHeight-kNaviBarHeight)
//            loadingView = DYPLoadingView(frame: rectLoading)
//            self.view.addSubview(loadingView!)
//        }
//        /**
//         *  半透明loading
//         *
//         */
//        func startAlphaLoading() {
//            self.initLoadingView()
//            if (loadingView?.isLoading() == false) {
//                loadingView?.startLoading()
//            }
//            DispatchQueue.global().async {
//                DispatchQueue.main.async {
//                    self.loadingView?.isHidden = false
//                    self.loadingView?.backgroundColor = RGBVACOLOR(0x000000, 0.5)
//                    self.view.bringSubview(toFront: self.loadingView!)
//                }
//            }
//        }
//        /**
//         *  不透明loading
//         *
//         */
//        func startLoading() {
//            self.initLoadingView()
//            if (loadingView?.isLoading() == false) {
//                loadingView?.startLoading()
//            }
//            DispatchQueue.global().async {
//                DispatchQueue.main.async {
//                    self.loadingView?.isHidden = false
//                    self.loadingView?.backgroundColor = RGBVCOLOR(0xededed);
//                    self.view.bringSubview(toFront: self.loadingView!)
//                }
//            }
//        }
//        /**
//         *  停止loading
//         *
//         */
//        func stopLoading() {
//            DispatchQueue.global().async {
//                DispatchQueue.main.async {
//                    self.loadingView?.isHidden = true
//                }
//            }
//            if (loadingView?.isLoading() == true) {
//                loadingView?.stopLoading()
//            }
//        }
//        
//        
//        private func initEmptyViewFrame(frame: CGRect, strImg: String, strDes: String) {
//            if emptyView != nil {
//                return
//            }
//            emptyView = DYPEmptyView(frame: frame, imgName: strImg, describe: strDes)
//            self.view.addSubview(emptyView!)
//        }
//        /**
//         *  展示空白页面
//         *
//         */
//        func showEmptyViewFrame(frame: CGRect, strImg: String, strDes: String) {
//            self.initEmptyViewFrame(frame: frame, strImg: strImg, strDes: strDes)
//            DispatchQueue.main.async {
//                self.emptyView?.isHidden = false
//                self.view.bringSubview(toFront: self.emptyView!)
//            }
//        }
//        /**
//         *  隐藏空白页面
//         *
//         */
//        func hiddenEmptyView() {
//            if emptyView?.isHidden == true {
//                return
//            }
//            DispatchQueue.main.async {
//                self.emptyView?.isHidden = true
//            }
//        }
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
        //MARK: - 释放请求
        private func releaseRequestTasks() {
//            let selCancel: Selector = Selector(kSelectorStruct.cancelRequest)
//            if (viewModel != nil) && (viewModel?.responds(to: selCancel))!  {
//                viewModel?.cancelRequest()
//            }
        }
//
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
//
        deinit{
            printLog(message: "== deinit == \(String(describing: type(of: self)))")
        }
    }
