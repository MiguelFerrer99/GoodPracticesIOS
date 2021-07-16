//
//  AppDelegate.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          
        configureKeyboard()
          
        return true
    }
    
    func configureKeyboard() {
        IQKeyboardManager.shared().isEnabled                    = true
        IQKeyboardManager.shared().shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared().isEnableAutoToolbar          = false
        IQKeyboardManager.shared().shouldResignOnTouchOutside   = true
    }
}
