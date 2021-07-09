//
//  FilterAnswers-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

protocol SelectAnswerDelegate {
    func selectAnswer(filterIndex: Int, answerName: String)
}

class FilterAnswersViewController: ViewController, ViewModelController {
    typealias T = FilterAnswersViewModel
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return viewModel.title
    }
    var viewModel: FilterAnswersViewModel! {
      didSet { fillUI() }
    }
    var delegate: SelectAnswerDelegate?
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillUI()
    }
    
    // MARK: - Functions
    func setUpUI() {
        configure(tableView)
    }
    
    func fillUI() {
        if !isViewLoaded { return }
        setUpUI()
    }
        
    // MARK: - Observers
}
