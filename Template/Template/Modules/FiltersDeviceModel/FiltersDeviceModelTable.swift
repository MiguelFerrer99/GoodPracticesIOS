//
//  FiltersDeviceModelTable.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FiltersDeviceModelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configure(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EmptyCell.self) //La usamos cuando no hay modelos con los parámetros elegidos
        tableView.register(BrandCell.self) //Reutilizamos la BrandCell como celda para cada DeviceModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.question?.answers.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let question = viewModel.question {
            let deviceCellVM = BrandCellViewModel(answer: question.answers[indexPath.row], isSelected: (question.selectedAnswerIndex == indexPath.row))
            let cell = tableView.dequeue(BrandCell.self, viewModel: deviceCellVM)
            return cell
        }
        let navBarHeigth = self.navigationController!.navigationBar.frame.size.height
        let tabBarHeigth = self.tabBarController!.tabBar.frame.size.height
        let emptyCellVM = EmptyCellViewModel(message: "No hay aparatos de este tipo.", navBarHeight: navBarHeigth, tabBarHeight: tabBarHeigth)
        let emptyTableCell = tableView.dequeue(EmptyCell.self, viewModel: emptyCellVM)
        return emptyTableCell
    }
}
