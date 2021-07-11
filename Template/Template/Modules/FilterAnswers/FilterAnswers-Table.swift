//
//  FilterAnswers-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FilterAnswersViewController: UITableViewDelegate, UITableViewDataSource, SelectDeviceDelegate {
    
    func configure(_ tableView: UITableView) {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(FilterAnswersCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = FilterAnswersCellViewModel(answer: viewModel.answers[indexPath.row])
        let cell = tableView.dequeue(FilterAnswersCell.self, viewModel: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.filterIndex == 4 && indexPath.row == viewModel.answers.count-2 {
            let filterDevicesVM = FilterDevicesViewModel(title: "Fregadoras", devices: viewModel.fregadoraDevices, filterIndex: viewModel.filterIndex)
            let filterDevicesVC = UIViewController.instantiate(viewController: FilterDevicesViewController.self, withViewModel: filterDevicesVM)
            tableView.deselectRow(at: indexPath, animated: true)
            filterDevicesVC.delegate = self
            push(viewController: filterDevicesVC)
        } else if viewModel.filterIndex == 4 && indexPath.row == viewModel.answers.count-1 {
            let filterDevicesVM = FilterDevicesViewModel(title: "Aspiradoras", devices: viewModel.aspiradoraDevices, filterIndex: viewModel.filterIndex)
            let filterDevicesVC = UIViewController.instantiate(viewController: FilterDevicesViewController.self, withViewModel: filterDevicesVM)
            tableView.deselectRow(at: indexPath, animated: true)
            filterDevicesVC.delegate = self
            push(viewController: filterDevicesVC)
        } else {
            delegate?.selectAnswer(filterIndex: viewModel.filterIndex, answerName: viewModel.answers[indexPath.row].name)
            self.pop()
        }
    }
    
    func selectDevice(filterIndex: Int, answerName: String) {
        delegate?.selectAnswer(filterIndex: filterIndex, answerName: answerName)
        self.pop()
    }
}
