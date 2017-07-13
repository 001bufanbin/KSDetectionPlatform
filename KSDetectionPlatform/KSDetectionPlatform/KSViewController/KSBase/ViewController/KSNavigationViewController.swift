//
//  KSNavigationViewController.swift
//  DYPAllSwift
//
//  Created by kris on 2016/11/19.
//  Copyright © 2016年 kris. All rights reserved.
//

import UIKit

class KSNavigationViewController: UINavigationController, UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.interactivePopGestureRecognizer?.delegate = self
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIScreenEdgePanGestureRecognizer {
            if (self.viewControllers.count == 1 || (self.topViewController is DYPTabBarController)) {
                return false
            }
        }
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
