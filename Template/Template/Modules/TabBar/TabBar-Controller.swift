//
//  TabBar-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 6/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tabbar: UITabBar!
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        let tabBarItems = tabBar.items!
        for (index, _) in tabBarItems.enumerated() {
            setNavigation(index)
        }
        navigationController?.navigationBar.isHidden = true
    }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(languageChanged),
                                             name: .LanguageChanged,
                                             object: nil)
  }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.viewControllers?[1],
           !Cache.get(boolFor: .logged) {
          showGuestAlert()
          return false
        } else {
          return true
        }
    }
    
    // MARK: - Functions
  fileprivate func setNavigation(_ index: Int) {
        let nav = viewControllers![index] as? UINavigationController
        switch index {
        case 0:
            let homeVM = HomeViewModel()
            let homeVC = UIViewController.instantiate(viewController: HomeViewController.self, withViewModel: homeVM)
            nav?.viewControllers = [homeVC]
        case 1:
            let profileVM = ProfileViewModel()
            let profileVC = UIViewController.instantiate(viewController: ProfileViewController.self, withViewModel: profileVM)
            nav?.viewControllers = [profileVC]
        case 2:
            let filtersVM = FiltersViewModel()
            let filtersVC = UIViewController.instantiate(viewController: FiltersViewController.self, withViewModel: filtersVM)
            nav?.viewControllers = [filtersVC]
        default:
            break
        }
    }
    
  
  
    @objc func languageChanged(notification: NSNotification) {
        setUpUI()
    }
  
    func setUpUI() {
        let tabBarItems = tabBar.items!
        tabBarItems[0].title = "home_tabbar_item_title".localized(Cache.get(stringFor: .language))
        tabBarItems[1].title = "profile_tabbar_item_title".localized(Cache.get(stringFor: .language))
        tabBarItems[2].title = "filters_tabbar_item_title".localized(Cache.get(stringFor: .language))
    }
    
    // MARK: - Observers
    
}
