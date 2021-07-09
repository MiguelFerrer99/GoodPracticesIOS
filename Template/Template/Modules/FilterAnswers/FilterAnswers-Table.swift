//
//  FilterAnswers-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FilterAnswersViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        delegate?.selectAnswer(filterIndex: viewModel.filterIndex, answerName: viewModel.answers[indexPath.row].name)
        self.pop()
    }
}
