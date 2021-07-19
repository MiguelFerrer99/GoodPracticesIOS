//
//  Home-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class HomeViewModel: ViewModel {
    
    //MARK: - Properties
    private(set) var _methods: Dynamic<[Methodology]> = Dynamic([])
    var methods: [Methodology] {
      get { _methods.value }
      set { _methods.value = newValue }
    }
    
    let methodologiesService = MethodologiesService()
    //Variable para marcar cuando está cargando los methods y cuando no
    var isLoading: Bool = true

    private(set) var _searchParameters: Dynamic<[String: String]?> = Dynamic([:])
    var searchParameters: [String: String]? {
      get { _searchParameters.value }
      set { _searchParameters.value = newValue }
    }

    private(set) var _needsToReload: Dynamic<Bool> = Dynamic(false)
    var needsToReload: Bool {
      get { _needsToReload.value }
      set { _needsToReload.value = newValue }
    }

    //MARK: - Initializers
    init() {
      subscribeToNotifications()
    }

    deinit {
      unsubscribeToNotifications()
    }

    //MARK: - Functions
    func getMethodologies(_ completion: @escaping ((Result<[Methodology], API.NetworkError>) -> Void)) {
      methodologiesService.getMethodologies { result in
        switch result {
        case .success(let methodologies):
            self.methods = methodologies
            completion(result)

        case .failure(_):
            completion(result)
        }
      }
    }

    func subscribeToNotifications() {
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(filtersChanged),
                                             name: .FiltersChanged,
                                             object: nil)
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(savedMethodologiesChanged),
                                             name: .SavedMethodologiesChanged,
                                             object: nil)
    }

    func unsubscribeToNotifications() {
      NotificationCenter.default.removeObserver(self)
    }

    @objc fileprivate func filtersChanged(_ notification: NSNotification) {
      searchParameters = MethodologiesService.searchParameters
    }

    @objc fileprivate func savedMethodologiesChanged(_ notification: NSNotification) {
      needsToReload = true
    }
}
