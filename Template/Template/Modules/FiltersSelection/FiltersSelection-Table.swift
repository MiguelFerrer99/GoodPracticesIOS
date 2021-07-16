//
//  FiltersSelection-Table.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension FiltersSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configure(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FiltersSelectionCell.self)
        tableView.register(BrandCell.self)
        tableView.register(DeviceCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.question.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.index {
        case 2: //Manual / Con aparato
            let filtersSelectionVM = FiltersSelectionCellViewModel(answer: viewModel.question.answers[indexPath.row], isSelected: (indexPath.row == viewModel.question.selectedAnswerIndex), isClass: true)
            let cell = tableView.dequeue(FiltersSelectionCell.self, viewModel: filtersSelectionVM)
            return cell
        
        case 3: //Brands
          let brandSelectionVM = BrandCellViewModel(answer: viewModel.question.answers[indexPath.row], isSelected: (indexPath.row == viewModel.question.selectedAnswerIndex))
          let cell = tableView.dequeue(BrandCell.self, viewModel: brandSelectionVM)
          return cell

        case 4: //Devices
          let brandSelectionVM = DeviceCellViewModel(answer: viewModel.question.answers[indexPath.row], isSelected: (indexPath.row == viewModel.question.selectedAnswerIndex))
          let cell = tableView.dequeue(DeviceCell.self, viewModel: brandSelectionVM)
          return cell
            
        default: //Places and Frequencies
            let filtersSelectionVM = FiltersSelectionCellViewModel(answer: viewModel.question.answers[indexPath.row], isSelected: (indexPath.row == viewModel.question.selectedAnswerIndex))
            let cell = tableView.dequeue(FiltersSelectionCell.self, viewModel: filtersSelectionVM)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row != viewModel.question.selectedAnswerIndex) {
            viewModel.question.selectedAnswerIndex = indexPath.row
            viewModel.delegate?.changeQuestion(question: viewModel.question, index: viewModel.index)
            
            if let places = viewModel.places {
                viewModel.delegate?.changeSelectedPlace(place: places[indexPath.row])
            }

            if let frequencies = viewModel.frequencies {
                viewModel.delegate?.changeSelectedFrequency(frequency: frequencies[indexPath.row])
            }

            if let brands = viewModel.brands {
                viewModel.delegate?.changeSelectedBrand(brand: brands[indexPath.row])
            }
            
            if viewModel.deviceTypes != nil {
                viewModel.selectedType = viewModel.deviceTypes?[indexPath.row]
                //...
            }
            
            tableView.reloadData()
            if viewModel.index != 4 {
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
