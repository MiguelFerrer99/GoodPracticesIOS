//
//  FilterDevices-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 10/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

protocol SelectDeviceDelegate {
    func selectDevice(filterIndex: Int, answerName: String)
}

class FilterDevicesViewController: ViewController, ViewModelController {
    typealias T = FilterDevicesViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return viewModel.title
    }
    var viewModel: FilterDevicesViewModel! {
        didSet { fillUI() }
    }
    var delegate: SelectDeviceDelegate?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        fillUI()
    }

    // MARK: - Functions
    func fillUI() {
        if !isViewLoaded { return }
        setUpUI()
    }

    func setUpUI() {
        configure(tableView)
    }

    // MARK: - Observers
}
