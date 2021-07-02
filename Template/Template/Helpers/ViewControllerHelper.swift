//
//  ViewControllerHelper.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

//
//  ViewModelController.swift
//  Chatripp
//
//  Created by Toni García Alhambra on 25/10/2019.
//  Copyright © 2019 rudo. All rights reserved.
//

import UIKit

// MARK: - ViewController module
protocol ViewModelController: UIViewController {
  associatedtype T: ViewModel
  var viewModel: T! { get set }
}


extension UIViewController {
  /// It returns the name of the StoryBoard if it follows the Rudo Rules.
  private class func getStoryboardName() -> String {
    return "\(self)".replacingOccurrences(of: "ViewController", with: "")
  }

  /// Return a viewControlle instantiated with a viewModel.
  ///
  /// The name of the storyboard needs to be the same as the name of the module, and the the viewController's name needs to be the module's name followed by -Controller.
  /// The storyboardID must be the same as the class name of the viewController.
  ///
  /// - Parameters:
  ///   - viewController: The viewController type to present.
  ///   - viewModel: The viewModel for the viewController.
  internal static func instantiate<T: ViewModelController>(viewController: T.Type, withViewModel viewModel: ViewModel, function: String = #function, line: Int = #line, file: String = #file) -> T {

    let storyboardID = viewController.getStoryboardName()

    guard let vc = UIStoryboard(name: viewController.getStoryboardName(), bundle: nil).instantiateViewController(withIdentifier: "\(viewController)") as? T else {

      fatalError("ViewController with identifier \(storyboardID), not found in \(viewController) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")

    }

    guard let _ = viewModel as? T.T else {
      fatalError("The viewModel type doesn't match with the viewControllers variable.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
    }

    vc.viewModel = (viewModel as! T.T)

    return vc
  }

  /// Return a viewControlle instantiated..
  ///
  /// The name of the storyboard needs to be the same as the name of the module, and the the viewController's name needs to be the module's name followed by -Controller.
  /// The storyboardID must be the same as the class name of the viewController.
  ///
  /// - Parameters:
  ///   - viewController: The viewController type to present.
  internal static func instantiate<T: UIViewController>(viewController: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {
    let storyboardID = viewController.getStoryboardName()

    guard let vc = UIStoryboard(name: viewController.getStoryboardName(), bundle: nil).instantiateViewController(withIdentifier: "\(viewController)") as? T else {

      fatalError("ViewController with identifier \(storyboardID), not found in \(viewController) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")

    }

    return vc
  }
}
