//
//  FaqHeaderTableCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FaqHeaderTableCell: UITableViewCell, Reusable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = "Aqui resolveremos tus mayores dudas sobre nuestros servicios"
    }
}
