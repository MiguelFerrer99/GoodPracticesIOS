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
    tableView.dataSource = self
    tableView.register(FaqHeaderTableCell.self)
    tableView.register(FaqTableCell.self)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.questions.count + 1
  }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
          let cell = tableView.dequeue(FaqHeaderTableCell.self)
          return cell
        }
        else {
          let cellVM = FaqTableCellViewModel(faq: viewModel.questions[indexPath.row - 1])
          let cell = tableView.dequeue(FaqTableCell.self, viewModel: cellVM)
          return cell
        }
    }
}
