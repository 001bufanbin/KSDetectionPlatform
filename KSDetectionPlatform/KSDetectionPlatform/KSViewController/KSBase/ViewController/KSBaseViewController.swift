    //
    //  KSBaseViewController.swift
    //  DYPSwift
    //
    //  Created by kris on 2016/11/8.
    //  Copyright © 2016年 kris. All rights reserved.
    //
    
    import UIKit
    
    import MBProgressHUD
    
    /// 导航栏左右按钮宽度
    let kNavBtnLeftAndRight_W: CGFloat = 60.0
    /// 导航栏标题按钮宽度
    let kNavBtnTitle_W: CGFloat        = 80.0
    
    public enum KSHUDShowType {
        case tost, load
    }
    
    
    class KSBaseViewController: UIViewController, UINavigationControllerDelegate {
        
        var btnTitle: UIButton!
        var btnLeft: UIButton!
        var btnRight: UIButton!
        
        var hudTost: MBProgressHUD?
        var hudLoad: MBProgressHUD?
        
        
        //MARK: - 初始化
        deinit{
            printLog(message: "deinit == \(String(describing: type(of: self)))")
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
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
            btnTitle.setImage(LOADPATHIMAGE(imgNor), for: .normal)
            btnTitle.setImage(LOADPATHIMAGE(imgSel), for: .selected)
        }
        
        func setGoBackBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
            if hidden {
                btnLeft.isHidden = true
                return;
            }
            btnLeft.setTitle(strTitle, for: .normal)
            btnLeft.setImage(LOADPATHIMAGE(imgNor), for: .normal)
            btnLeft.setImage(LOADPATHIMAGE(imgSel), for: .selected)
            btnLeft.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        }
        
        func setRightBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
            if hidden {
                btnRight.isHidden = true
                return
            }
            btnRight.setTitle(strTitle, for: .normal)
            btnRight.setImage(LOADPATHIMAGE(imgNor), for: .normal)
            btnRight.setImage(LOADPATHIMAGE(imgSel), for: .selected)
        }
        
        //MARK: - 导航栏响应函数
        func titleBtnClickedHandeler(_ sender: UIButton) {
            
        }
        func goBackBtnClickHandler(_ sender: UIButton) {
            _ = self.navigationController?.popViewController(animated: true)
            self.releaseRequestTasks()
        }
        func rightBtnClickedHandeler(_ sender: UIButton ) {
            
        }
        
        // MARK: - UINavigationControllerDelegate
        func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
            if navigationController is KSNavigationViewController {
                if let coordinator = navigationController.topViewController?.transitionCoordinator {
                    if coordinator.initiallyInteractive {
                        coordinator.notifyWhenInteractionEnds({ (context) in
                            if !coordinator.isCancelled {
                                let fromVC = context.viewController(forKey: UITransitionContextViewControllerKey.from)
                                if let baseVC: KSBaseViewController = fromVC as? KSBaseViewController {
                                    baseVC.releaseRequestTasks()
                                }
                            }
//                            //手势返回，打印栈内元素情况
//                            printLog(message: "isAnimated == \(context.isAnimated)")
//                            printLog(message: "presentationStyle == \(context.presentationStyle)")
//                            printLog(message: "initiallyInteractive == \(context.initiallyInteractive)")
//                            printLog(message: "isInteractive == \(context.isInteractive)")
//                            printLog(message: "isCancelled == \(context.isCancelled)")
//                            printLog(message: "transitionDuration == \(context.transitionDuration)")
//                            printLog(message: "percentComplete == \(context.percentComplete)")
//                            printLog(message: "completionVelocity == \(context.completionVelocity)")
//                            printLog(message: "completionCurve == \(context.completionCurve)")
//                            printLog(message: "From VC == \(String(describing: context.viewController(forKey: UITransitionContextViewControllerKey.from)))")
//                            printLog(message: "To VC == \(String(describing: context.viewController(forKey: UITransitionContextViewControllerKey.to)))")
//                            printLog(message: "From View == \(String(describing: context.view(forKey: UITransitionContextViewKey.from)))")
//                            printLog(message: "To View == \(String(describing: context.view(forKey: UITransitionContextViewKey.to)))")
//                            printLog(message: "Container View == \(context.containerView)")
//                            printLog(message: "targetTransform == \(context.targetTransform)")
                        })
                    }
                }
            }
        }
        
        //MARK: - 页面点击取消编辑
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
        
        final func endEdit() -> Void {
            self.view.endEditing(true)
        }
        
        // MARK: - 页面提示相关
        final func showTost(_ hint: String, duration:TimeInterval = 1, completionBlock:@escaping () -> ()) -> Void {
            if self.hudTost == nil {
                self.initHudView(.tost)
            }
            DispatchQueue.main.async {
                self.hudTost?.label.text = hint
                self.view.bringSubview(toFront: self.hudTost!)
                self.hudTost?.show(animated: true)
                self.hudTost?.hide(animated: true, afterDelay: duration)
                self.hudTost?.completionBlock = {
                    completionBlock()
                }
            }
        }
        
        final func showLoad(_ hint: String = "加载中...") -> Void {
            if self.hudLoad == nil {
                self.initHudView(.load)
            }
            DispatchQueue.main.async {
                self.hudLoad?.label.text = hint
                self.view.bringSubview(toFront: self.hudLoad!)
                self.hudLoad?.show(animated: true)
            }
        }
        
        final func hiddenLoad() -> Void {
            DispatchQueue.main.async {
                self.hudLoad?.hide(animated: true)
            }
        }
        
        final func initHudView(_ type: KSHUDShowType) -> Void {
            let hud: MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.animationType = .zoom
            hud.bezelView.layer.cornerRadius = 5.0
            hud.bezelView.color = RGBVACOLOR(0x000000, 0.75)
            hud.contentColor = UIColor.white
            hud.removeFromSuperViewOnHide = false
            self.view.addSubview(hud)
            switch type {
            case .tost:
                hud.mode = .text
                hud.isUserInteractionEnabled = false
                self.hudTost = hud
            case .load:
                hud.mode = .indeterminate
                hud.isUserInteractionEnabled = true
                self.hudLoad = hud
            }
        }
        
        
        // MARK: - 统一处理请求错误码
        func manageErrorStatus(strStatus: String, strMsg: String) {
            
        }
        
        func manageFailStatus() {
            
        }
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
        func releaseRequestTasks() -> Void {
            printLog(message: "releaseRequestTasks == \(String(describing: type(of: self)))")
        }
        
        
    }
