//
//  RootViewController.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - Properties
  var useLargeTitle: Bool {
    return false
  }

  var viewDidAppear = false

  var setNavigationBarTransparent: Bool {
    return false
  }

  var hideNavigationBar: Bool {
    return false
  }

  var hideCart: Bool {
    return false
  }

  var navBarHeight: CGFloat {
    if #available(iOS 13.0, *) {
      return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
        (navigationController?.navigationBar.frame.height ?? 0.0)
    } else {
      return UIApplication.shared.statusBarFrame.size.height + (navigationController?.navigationBar.frame.height ?? 0)
    }
  }

  var dismissGestureEnabled: Bool = true {
    willSet {
      if #available(iOS 13.0, *) {
        self.isModalInPresentation = !newValue
      }
    }
  }

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.navigationBar.prefersLargeTitles = true

    let backItem = UIBarButtonItem()
    backItem.title = ""
    navigationController?.navigationBar.topItem?.backBarButtonItem = backItem

    overrideUserInterfaceStyle = .light

    NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.setNavigationBarHidden(hideNavigationBar, animated: false)
    navigationController?.navigationBar.alpha = setNavigationBarTransparent ? 0 : 1
    navigationItem.largeTitleDisplayMode = useLargeTitle ? .always : .never
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    viewDidAppear = true

    navigationController?.setNavigationBarHidden(hideNavigationBar, animated: false)
    navigationController?.navigationBar.alpha = setNavigationBarTransparent ? 0 : 1
    navigationItem.largeTitleDisplayMode = useLargeTitle ? .always : .never
  }


  // MARK: - Functions
  @objc func didBecomeActive() {
    navigationController?.setNavigationBarHidden(hideNavigationBar, animated: false)
    navigationController?.navigationBar.alpha = setNavigationBarTransparent ? 0 : 1
    navigationItem.largeTitleDisplayMode = useLargeTitle ? .always : .never
  }
}
