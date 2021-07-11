//
//  Filters-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource, SelectAnswerDelegate, SelectDeviceDelegate {
    
    func configure(_ tableView: UITableView) {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(FiltersQuestionCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = FiltersQuestionCellViewModel(question: viewModel.filters[indexPath.row].question)
        let cell = tableView.dequeue(FiltersQuestionCell.self, viewModel: cellVM)
        cell.answerLabel.text = viewModel.answerNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filterAnswersVM = FilterAnswersViewModel(title: viewModel.filters[indexPath.row].title, answers: viewModel.filters[indexPath.row].answers, filterIndex: indexPath.row)
        let filterAnswersVC = UIViewController.instantiate(viewController: FilterAnswersViewController.self, withViewModel: filterAnswersVM)
        tableView.deselectRow(at: indexPath, animated: true)
        filterAnswersVC.delegate = self
        push(viewController: filterAnswersVC)
    }
    
    func selectAnswer(filterIndex: Int, answerName: String) {
        viewModel.answerNames[filterIndex] = answerName
        if viewModel.answerNames[2] == "Con aparato" && viewModel.filters.count == 3 {
            viewModel.filters.append(viewModel.filter4)
            viewModel.filters.append(viewModel.filter5)
        } else if viewModel.answerNames[2] == "Manual" && viewModel.filters.count == 5 {
            viewModel.filters.removeLast()
            viewModel.filters.removeLast()
        }
        tableView.reloadData()
    }
    
    func selectDevice(filterIndex: Int, answerName: String) {
        viewModel.answerNames[filterIndex] = answerName
        tableView.reloadData()
    }
}
