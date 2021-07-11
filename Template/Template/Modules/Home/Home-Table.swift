//
//  Home-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, ReloadTableViewDelegate {
    
    func configure(_ tableView: UITableView) {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(MethodologyCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.methodologies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = MethodologyCellViewModel(methodology: viewModel.methodologies[indexPath.row])
        let cell = tableView.dequeue(MethodologyCell.self, viewModel: cellVM)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func reloadTableView(methodologyIndex: Int) {
        tableView.reloadData()
    }
}