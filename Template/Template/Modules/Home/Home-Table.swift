//
//  Home-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configure(_ tableView: UITableView) {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(MethodologyCell.self)
      tableView.register(EmptyCell.self)
      tableView.register(LoadingCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.methods.count == 0 ? 1 : viewModel.methods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !viewModel.isLoading else { return tableView.dequeue(LoadingCell.self) }
        if viewModel.methods.count == 0 {
          let navBarHeigth = self.navigationController!.navigationBar.frame.size.height
          let tabBarHeigth = self.tabBarController!.tabBar.frame.size.height
          let emptyTableCellVM = EmptyCellViewModel(message: "No hay métodos", navBarHeight: navBarHeigth, tabBarHeight: tabBarHeigth)
          let emptyTableCell = tableView.dequeue(EmptyCell.self, viewModel: emptyTableCellVM)
          return emptyTableCell
        }
        let cellVM = MethodologyCellViewModel(methodology: viewModel.methods[indexPath.row])
        let cell = tableView.dequeue(MethodologyCell.self, viewModel: cellVM)
        cell.presenter = self
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let methodologyVM = MethodologyViewModel(methodology: viewModel.methods[indexPath.row])
        let methodologyVC = UIViewController.instantiate(viewController: MethodologyViewController.self, withViewModel: methodologyVM)
        push(viewController: methodologyVC)
    }
}
