//
//  FilterDevices-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 10/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FilterDevicesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configure(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilterAnswersCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = FilterAnswersCellViewModel(answer: viewModel.devices[indexPath.row])
        let cell = tableView.dequeue(FilterAnswersCell.self, viewModel: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectDevice(filterIndex: viewModel.filterIndex, answerName: viewModel.devices[indexPath.row].name)
        self.pop()
    }
}
