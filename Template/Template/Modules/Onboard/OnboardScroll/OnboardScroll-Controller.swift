//
//  Onboard-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 5/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class OnboardScrollViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var saltarButton: UIButton!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return true
    }
    var viewModel = OnboardScrollViewModel()
    var frame = CGRect.zero

    // MARK: - Life cycle
    override func viewDidLoad() {
      super.viewDidLoad()
        
      configure(scrollView)
    }

    // MARK: - Functions
    func fillUI() {
      if !isViewLoaded { return }
    }
    
    // MARK: - Observers
    @IBAction func saltarPressed(_ sender: Any) {
        Cache.set(.onboardDone, true)
        let startupVC = UIViewController.instantiate(viewController: StartupViewController.self)
        changeRoot(to: startupVC)
    }
}
