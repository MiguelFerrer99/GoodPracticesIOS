//
//  Filters-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configure(_ tableView: UITableView) {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(FiltersQuestionCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.tableCells[indexPath.row]
        
        switch cellType {
        case .device:
            let cellVM = FiltersQuestionCellViewModel(question: viewModel.questions[indexPath.row], selectedDeviceName: viewModel.selectedDevice?.name)
            let cell = tableView.dequeue(FiltersQuestionCell.self, viewModel: cellVM)
            return cell
        default:
            let cellVM = FiltersQuestionCellViewModel(question: viewModel.questions[indexPath.row])
            let cell = tableView.dequeue(FiltersQuestionCell.self, viewModel: cellVM)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = viewModel.tableCells[indexPath.row]
        switch cellType {
        case .place:
            break
        default: break
        }
    }
}
