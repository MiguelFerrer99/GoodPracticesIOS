//
//  Onboard-Collection.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 6/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension OnboardCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func configure(_ collectionView: UICollectionView){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OnboardCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.onboardScreens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let onboardScreen = viewModel.onboardScreens[indexPath.row]
        let onboardCellVM = OnboardCellViewModel(onboardScreen: onboardScreen)
        let onboardCell = collectionView.dequeue(OnboardCell.self, for: indexPath, viewModel: onboardCellVM)

        return onboardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.section
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
        
        if let ip = collectionView.indexPathForItem(at: center) {
            pageControl.currentPage = ip.row
            
            if ip.row == viewModel.onboardScreens.count-1  {
                saltarButton.setTitle("Continuar", for: .normal)
            } else {
                saltarButton.setTitle("Saltar", for: .normal)
            }
        }
    }
}
