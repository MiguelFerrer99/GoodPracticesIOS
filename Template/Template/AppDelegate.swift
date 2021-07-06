//
//  AppDelegate.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      if Cache.get(boolFor: .onboardDone) {
          window?.rootViewController = UIViewController.instantiate(viewController: StartupViewController.self)
      } else {
          window?.rootViewController = UIViewController.instantiate(viewController: OnboardCollectionViewController.self)
          //window?.rootViewController = UIViewController.instantiate(viewController: OnboardScrollViewController.self)
      }
      
    return true
  }
}
