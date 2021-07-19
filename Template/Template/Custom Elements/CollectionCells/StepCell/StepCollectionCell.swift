//
//  StepCollectionCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class StepCollectionCell: UICollectionViewCell, ViewModelCell {
    typealias T = StepCollectionCellViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var stepImageView: UIImageView!
    @IBOutlet weak var numberOfStepLabel: UILabel!
    @IBOutlet weak var metodoLabel: UILabel!
    @IBOutlet weak var especificacionesLabel: UILabel!
    @IBOutlet weak var notasLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: StepCollectionCellViewModel! {
      didSet { fillUI() }
    }

    //MARK: - Functions
    func fillUI() {
        numberOfStepLabel.text = "Paso \(viewModel.actualStep)/\(viewModel.totalSteps)"
        metodoLabel.text = viewModel.step.method
        especificacionesLabel.text = viewModel.step.specifications
        notasLabel.text = viewModel.step.notes
        if let image = viewModel.step.image, let midsize = image.midsize {
            stepImageView.setURLImage(midsize)
        }
    }
}
