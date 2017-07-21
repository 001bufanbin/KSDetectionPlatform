//
//  KSLoginView.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/7/20.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

/// 页面左右边距
private let kAll_X: CGFloat = 36.0

/// 内容区域Y
private let kViewContent_Offset_Y: CGFloat = -10.0
/// 内容区域高度
private let kViewContent_H: CGFloat = 150.0
/// 静态文本宽度
private let kTextFieldConst_W: CGFloat = 30.0
/// 用户名输入框Y
private let kTextFieldUser_Y: CGFloat = 50.0
/// 输入框高度
private let kTextField_H: CGFloat = 35.0
/// 静态文本和输入框水平间
private let kTextField_Hor_Spc: CGFloat = 16.0
/// 输入框和和底部线的距离
private let kTextField_Ver_Line_Spc: CGFloat = 2.0
/// 密码离账号的距离
private let kTextFieldPwd_Ver_Spc: CGFloat = 25.0

/// 登录按钮Y
private let kBtnLogin_Spc: CGFloat = 60.0
/// 登录按钮高度
private let kBtnLogin_H: CGFloat = 44.0

/// 底部logo距离底部距离
private let kImgViewUnder_EndY: CGFloat = 10.0
/// 底部logo宽度
private let kImgViewUnder_W: CGFloat = 94.0
/// 底部logo高度
private let kImgViewUnder_H: CGFloat = 50.0

class KSLoginView: UIView {
    
    /// 用户名输入框
    public var userNameTextField: UITextField!
    /// 密码输入框
    public var passWordTextField: UITextField!
    /// 登录按钮
    public var loginButton: UIButton!
    
    /// 头部视图
    private var imgViewHead: UIImageView!
    /// 内容区域
    private var viewContent: UIView!
    private var labUserConst: UILabel!
    private var viewLineUser: UIView!
    private var labPwdConst: UILabel!
    private var viewLinePwd: UIView!
    private var btnSecret: UIButton!
    /// 底部视图
    private var imgViewUnder: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initHeadView()
        self.initContentView()
        self.initLoginBtn()
        self.initUnderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 初始化页面元素
    //MARK: 顶部视图
    func initHeadView() -> Void {
        imgViewHead = UIImageView(frame: CGRect.zero)
        imgViewHead.image = UIImage(named: "JZGOffice_Login_HeadLogo.png")
        self.addSubview(imgViewHead)
    }
    
    //MARK: 内容区域
    func initContentView() -> Void {
        viewContent = UIView(frame: CGRect.zero)
        viewContent.layer.cornerRadius = 7.5
        viewContent.layer.masksToBounds = true
        viewContent.backgroundColor = UIColor.white
        self.addSubview(viewContent)
        
        //账号
        labUserConst = UILabel(frame: CGRect.zero)
        labUserConst.textColor = RGBVCOLOR(0x4f535c)
        labUserConst.font = KSFont(14)
        labUserConst.textAlignment = .left
        labUserConst.text = "账号"
        viewContent.addSubview(labUserConst)
        
        userNameTextField = UITextField(frame: CGRect.zero)
        userNameTextField.placeholder = "请输入账号"
        userNameTextField.font = KSFont(14)
        userNameTextField.returnKeyType = .next
        userNameTextField.becomeFirstResponder()
        viewContent.addSubview(userNameTextField)
        
        viewLineUser = UIView(frame: CGRect.zero)
        viewLineUser.backgroundColor = CUTTING_LINE_COLOR
        viewContent.addSubview(viewLineUser)
        
        //密码
        labPwdConst = UILabel(frame: CGRect.zero)
        labPwdConst.textColor = RGBVCOLOR(0x4f535c)
        labPwdConst.font = KSFont(14)
        labPwdConst.textAlignment = .left
        labPwdConst.text = "密码"
        viewContent.addSubview(labPwdConst)
        
        passWordTextField = UITextField(frame: CGRect.zero)
        passWordTextField.placeholder = "请输入密码"
        passWordTextField.font = KSFont(14)
        passWordTextField.isSecureTextEntry = true
        passWordTextField.returnKeyType = .done
        viewContent.addSubview(passWordTextField)
        
        btnSecret = UIButton(frame: CGRect.zero)
        //btnSecret.setImage(LOADIMAGE("JZGOffice_Login_BtnSecret.png"), for: .normal)
        //btnSecret.setImage(LOADIMAGE("JZGOffice_Login_BtnUnSecret.png"), for: .selected)
        btnSecret.addTarget(self, action: #selector(btnSectetClicked(_:)), for: .touchUpInside)
        viewContent.addSubview(btnSecret)
        
        viewLinePwd = UIView(frame: CGRect.zero)
        viewLinePwd.backgroundColor = CUTTING_LINE_COLOR
        viewContent.addSubview(viewLinePwd)
    }
    
    //MARK: 登录按钮
    func initLoginBtn() -> Void {
        loginButton = UIButton(frame: CGRect.zero)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = KSFont(16)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 3
        loginButton.backgroundColor = RGBVCOLOR(0x4996ff)
        self.addSubview(loginButton)
    }
    
    //MARK: 底部视图
    func initUnderView() -> Void {
        imgViewUnder = UIImageView(frame: CGRect.zero)
        //imgViewUnder.image = LOADIMAGE("JZGOffice_Login_underLogo.png")
        self.addSubview(imgViewUnder)
    }
    
    // MARK: - layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgViewHead.frame  = CGRect(x: 0,
                                    y: 0,
                                    width: kAppWidth,
                                    height: kAppWidth*290/750)
        viewContent.frame  = CGRect(x: 0,
                                    y: imgViewHead.frame.maxY,
                                    width: kAppWidth,
                                    height: kViewContent_H)
        labUserConst.frame = CGRect(x: kAll_X,
                                    y: kTextFieldUser_Y,
                                    width: kTextFieldConst_W,
                                    height: kTextField_H)
        userNameTextField.frame = CGRect(x: kAll_X+kTextFieldConst_W+kTextField_Hor_Spc,
                                         y: kTextFieldUser_Y,
                                         width: kAppWidth-kAll_X-kTextFieldConst_W-kTextField_Hor_Spc-kAll_X,
                                         height: kTextField_H)
        viewLineUser.frame = CGRect(x: kAll_X,
                                    y: userNameTextField.frame.maxY+kTextField_Ver_Line_Spc,
                                    width: kAppWidth-kAll_X*2,
                                    height: CUTTING_LINE_HEIGHT)
        labPwdConst.frame = CGRect(x: kAll_X,
                                   y: viewLineUser.frame.maxY+kTextFieldPwd_Ver_Spc,
                                   width: kTextFieldConst_W,
                                   height: kTextField_H)
        passWordTextField.frame = CGRect(x: kAll_X+kTextFieldConst_W+kTextField_Hor_Spc,
                                         y: viewLineUser.frame.maxY+kTextFieldPwd_Ver_Spc,
                                         width: kAppWidth-kAll_X-kTextFieldConst_W-kTextField_Hor_Spc-kTextField_H-kAll_X,
                                         height: kTextField_H)
        btnSecret.frame = CGRect(x: kAppWidth-kAll_X-kTextField_H,
                                 y: viewLineUser.frame.maxY+kTextField_Ver_Line_Spc,
                                 width: kTextField_H,
                                 height: kTextField_H)
        viewLinePwd.frame = CGRect(x: kAll_X,
                                   y: passWordTextField.frame.maxY+kTextField_Ver_Line_Spc,
                                   width: kAppWidth-kAll_X*2,
                                   height: CUTTING_LINE_HEIGHT)
        loginButton.frame = CGRect(x: kAll_X,
                                   y: viewContent.frame.maxY+kBtnLogin_Spc,
                                   width: kAppWidth-kAll_X*2,
                                   height: kBtnLogin_H)
        imgViewUnder.frame = CGRect(x: (kAppWidth-kImgViewUnder_W)/2, y: kAppHeight-kImgViewUnder_H-kImgViewUnder_EndY, width: kAppWidth-(kAppWidth-kImgViewUnder_W), height: kImgViewUnder_H)
        
        super.layoutSubviews()
    }
    
    
    // MARK: - btnHandler
    func btnSectetClicked(_ btn: UIButton) -> Void {
        btn.isSelected = !btn.isSelected
        if btn.isSelected {
            passWordTextField.isSecureTextEntry = false
        } else {
            passWordTextField.isSecureTextEntry = true
        }
    }
    
    
    
}
