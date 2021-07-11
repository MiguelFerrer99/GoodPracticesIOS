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
    
    // MARK: - Functions
    fileprivate func setNavigation(_ index: Int) {
        let nav = viewControllers![index] as? UINavigationController
        switch index {
        case 0:
            let homeVM = HomeViewModel()
            let homeVC = UIViewController.instantiate(viewController: HomeViewController.self, withViewModel: homeVM)
            nav?.viewControllers = [homeVC]
        case 1:
            let profileVC = UIViewController.instantiate(viewController: ProfileViewController.self)
            nav?.viewControllers = [profileVC]
        case 2:
            let filtersVM = FiltersViewModel()
            let filtersVC = UIViewController.instantiate(viewController: FiltersViewController.self, withViewModel: filtersVM)
            nav?.viewControllers = [filtersVC]
        default:
            break
        }
    }
    
    func fillUI() {
        
    }
    
    // MARK: - Observers
    
}
