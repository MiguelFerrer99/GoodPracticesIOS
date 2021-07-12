//
//  Home-SearchBar.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension HomeViewController: UISearchBarDelegate {
    
    func configureSearchBar() {
      navigationItem.searchController = UISearchController(searchResultsController: nil)
      navigationItem.searchController?.searchBar.delegate = self
      navigationItem.searchController?.obscuresBackgroundDuringPresentation = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let delayInSeconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            if let _ /*name*/ = searchBar.text {
                //... falta por hacer
            }
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
