//
//  Filterr-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersViewController: ViewController, ViewModelController {
    typealias T = FiltersViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Filtros"
    }
    var viewModel: FiltersViewModel! {
      didSet { fillUI() }
    }
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        fillUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tableView.reloadData()
    }
    
    // MARK: - Functions
    func setUpUI() {
        configure(tableView)
    }
    
    func fillUI() {
        if !isViewLoaded { return }
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        viewModel.getPlaces { _ in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        viewModel.getFrequencies { _ in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        viewModel.getBrands { _ in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        viewModel.getDeviceTypes { _ in
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
        
        viewModel._selectedBrand.bindAndFire { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func changeQuestion(question: Question, index: Int) {
      viewModel.questions[index] = question
      if(viewModel.questions.count > 3 && (viewModel.questions[2].selectedAnswerIndex == 0 ||
                                           viewModel.questions[2].selectedAnswerIndex == nil)) {
        viewModel.isManual = true
        viewModel.selectedBrand = nil
        viewModel.selectedDevice = nil
        viewModel.questions.removeLast(2)
        viewModel.removeBrandAndDevice()
      } else if(viewModel.questions.count == 3 && viewModel.questions[2].selectedAnswerIndex == 1) {
        viewModel.isManual = false
        viewModel.questions.append(viewModel.question4)
        viewModel.questions.append(viewModel.question5)
        viewModel.addBrandAndDevice()
      }
      tableView.reloadData()
    }

    func changeSelectedBrand(brand: Brand) {
      viewModel.selectedBrand = brand
    }

    func changeSelectedPlace(place: Place) {
      viewModel.selectedPlace = place
    }

    func changeSelectedFrequency(frequency: Frequency) {
      viewModel.selectedFrequency = frequency
    }

    func changeSelectedDevice(device: DeviceDetail) {
      viewModel.selectedDevice = device
    }
        
    // MARK: - Observers
    @IBAction func aplicarButtonPressed(_ sender: Any) {
        var selectedFilters: [String: String] = [:]
        
        if let place = viewModel.selectedPlace {
            selectedFilters["place_id"] = place.id
        }
        
        if let frequency = viewModel.selectedPlace {
            selectedFilters["frequency_id"] = frequency.id
        }
        
        if let isManual = viewModel.isManual {
            let isManualString = isManual ? "True" : "False"
            selectedFilters["is_manual"] = isManualString
        }
        
        if let brand = viewModel.selectedBrand {
            selectedFilters["brand_id"] = brand.id
        }
        
        if let device = viewModel.selectedDevice {
            selectedFilters["device_id"] = device.id
        }
        
        MethodologiesService.searchParameters = selectedFilters
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func reiniciarFiltrosButtonPressed(_ sender: Any) {
        viewModel.selectedPlace = nil
        viewModel.selectedFrequency = nil
        viewModel.isManual = nil
        viewModel.selectedBrand = nil
        viewModel.selectedDevice = nil
        for question in viewModel.questions {
            question.selectedAnswerIndex = nil
            for childrenQuestion in question.childrenQuestions {
                childrenQuestion.selectedAnswerIndex = nil
            }
        }
        viewModel.questions = [viewModel.question1, viewModel.question2, viewModel.question3]
        MethodologiesService.searchParameters = [:]
        tableView.reloadData()
    }
}
