//
//  Main-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MainViewController: ViewController {
  
  // MARK: - Properties
  var viewModel = MainViewModel()
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if Cache.get(stringFor: .language) == nil {
      if let langStr = Locale.current.languageCode {
        if langStr == "es" || langStr == "en" || langStr == "de" {
          Cache.setLanguage(language: langStr)
        } else {
          Cache.setLanguage(language: "en")
        }
      } else {
        Cache.setLanguage(language: "en")
      }
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let hasSeenOnboarding = Cache.get(boolFor: .onboardDone)
    let isLogged = Cache.get(boolFor: .logged)
    if isLogged {
        viewModel.usersService.getMe { result in
            switch result {
            case .success:
                let tabbarVC = UIViewController.instantiate(viewController: TabBarViewController.self)
                let nav = UINavigationController(rootViewController: tabbarVC)
                changeRoot(to: nav)
                
            case .failure:
                let startupVC = UIViewController.instantiate(viewController: StartupViewController.self)
                let nav = UINavigationController(rootViewController: startupVC)
                changeRoot(to: nav)
            }
        }
    } else {
      Cache.set(.logged, false)
      if hasSeenOnboarding {
          let startupVC = UIViewController.instantiate(viewController: StartupViewController.self)
          let nav = UINavigationController(rootViewController: startupVC)
          changeRoot(to: nav)
      } else {
          Cache.set(.onboardDone, false)
          let onboardCollectionVC = UIViewController.instantiate(viewController: OnboardCollectionViewController.self)
          let nav = UINavigationController(rootViewController: onboardCollectionVC)
          changeRoot(to: nav)
      }
    }
  }
}
