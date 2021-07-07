//
//  Faq-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FaqViewController: UITableViewDelegate, UITableViewDataSource {

  func configure(_ tableView: UITableView) {
    tableView.delegate = self
    tableView.delegate = self
    tableView.register(FaqHeaderTableCell.self)
    tableView.register(FaqTableCell.self)
      print("configure")
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.questions.count + 1
  }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row at")
        if indexPath.row == 0 {
            print("header cell")
          let cell = tableView.dequeue(FaqHeaderTableCell.self)
          return cell
        }
        else {
            print("cell")
          let cellVM = FaqTableCellViewModel(faq: viewModel.questions[indexPath.row - 1])
          let cell = tableView.dequeue(FaqTableCell.self, viewModel: cellVM)
          return cell
        }
    }
}
