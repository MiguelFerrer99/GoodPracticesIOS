//
//  OnboardCollection-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 6/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class OnboardCollectionViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var saltarButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return true
    }
    var viewModel = OnboardCollectionViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(collectionView)
    }
    
    // MARK: - Functions
    
    // MARK: - Observers
    @IBAction func saltarButtonPressed(_ sender: Any) {
        Cache.set(.onboardDone, true)
        let startupVC = UIViewController.instantiate(viewController: StartupViewController.self)
        changeRoot(to: startupVC)
    }
}
