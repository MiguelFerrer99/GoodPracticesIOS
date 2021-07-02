//
//  DatePicker-Controller.swift
//  HCB
//
//  Created by David Alhambra on 22/9/20.
//  Copyright © 2020 David Alhambra. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: class {
  func datePicker(_ datePicker: DatePickerViewController, didSelect date: Date)
}

protocol DatePickerDataSource: class {
  func maximumDate(_ datePicker: DatePickerViewController) -> Date?
  func minimumDate(_ datePicker: DatePickerViewController) -> Date?
  func selectedDate(_ datePicker: DatePickerViewController) -> Date
}

class DatePickerViewController: ViewController, ViewModelController {
  typealias T = DatePickerViewModel

  // MARK: - IBOutlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var datePicker: UIDatePicker!

  // MARK: - Properties
  var viewModel: DatePickerViewModel! {
    didSet { fillUI() }
  }

  weak var delegate: DatePickerDelegate?
  weak var dataSource: DatePickerDataSource?

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    fillUI()

    if #available(iOS 14.0, *) {
      datePicker.preferredDatePickerStyle = .inline
    }
  }

  // MARK: - Functions
  func fillUI() {
    if !isViewLoaded { return }

    titleLabel.text = viewModel.title

    datePicker.minimumDate = dataSource?.minimumDate(self)
    datePicker.maximumDate = dataSource?.maximumDate(self)
    datePicker.date = dataSource?.selectedDate(self) ?? Date()
  }

  // MARK: - Observers
  @IBAction func acceptButtonPressed(_ sender: UIButton) {
    delegate?.datePicker(self, didSelect: datePicker.date)
    
    dismiss(animated: true)
  }

  @IBAction func backgroundButtonPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}
