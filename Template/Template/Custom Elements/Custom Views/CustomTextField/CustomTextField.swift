//
//  CustomTextField.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UIView {
  // MARK: - IBInspectables
  @IBInspectable var capitalizeFirstLetter: Bool = false {
    willSet { textField.autocapitalizationType = newValue ? .words : .none }
  }

  @IBInspectable var hideContent: Bool = false {
    willSet {
      textField.isSecureTextEntry = newValue
      hideContentButton.isHidden = !newValue
    }
  }

  @IBInspectable var showLeftIcon: Bool = true {
    willSet { iconImageView.isHidden = !newValue }
  }

  @IBInspectable var icon: UIImage = UIImage() {
    willSet { iconImageView.image = newValue }
  }

  @IBInspectable var placeholder: String = "" {
    willSet { textField.placeholder = newValue.localized }
  }

  @IBInspectable var borderColor: UIColor = UIColor(named: "color_Primary") ?? .black {
    willSet { customView.layer.borderColor = newValue.cgColor }
  }

  @IBInspectable var borderSize: CGFloat = 0 {
    willSet { customView.layer.borderWidth = newValue}
  }
    
  @IBInspectable var singleBottomLine: Bool = false {
    willSet {
      let bottomLine = CALayer()
      bottomLine.frame = CGRect(x: 0, y: textField.frame.height, width: textField.frame.width+iconImageView.frame.width, height: 1)
      bottomLine.backgroundColor = UIColor.gray.cgColor
      bottomLine.opacity = 0.5
      textField.borderStyle = .none
      textField.layer.addSublayer(bottomLine)
    }
  }

  // MARK: - IBOutlets
  @IBOutlet var customView: UIView!

  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var hideContentButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!

  // MARK: - Properties
  var errorsToCheck = [TextFieldError]()

  var hasError: Bool {
    for error in errorsToCheck {
      let hasError = error.checkCondition(value)

      errorLabel.text     = error.localizedDescription
      errorLabel.isHidden = !hasError

      if hasError { return true }
    }

    return false
  }

  var value: String {
    return textField.text ?? ""
  }

  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: - Functions
  private func setup() {
    customView = loadViewFromNib()
    customView.frame = bounds

    customView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                   UIView.AutoresizingMask.flexibleHeight]

    addSubview(customView)
  }

  private func loadViewFromNib() -> UIView! {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView

    return view
  }

  func addErrorsToCheck(_ errorsToCheck: [TextFieldError]) {
    self.errorsToCheck = errorsToCheck
  }

  // MARK: - IBActions
  @IBAction func hideContentButtonPressed(_ sender: UIButton) {
    textField.isSecureTextEntry.toggle()
  }
}
