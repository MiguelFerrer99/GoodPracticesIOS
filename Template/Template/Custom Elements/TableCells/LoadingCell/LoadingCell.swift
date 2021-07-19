//
//  LoadingCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell, Reusable {

    //MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        activityIndicator.startAnimating()
    }
}
