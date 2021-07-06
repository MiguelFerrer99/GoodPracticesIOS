//
//  OnboardScroll-Scroll.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 6/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension OnboardScrollViewController: UIScrollViewDelegate {
    
    func configure(_ scrollView: UIScrollView){
        scrollView.delegate = self
        
        pageControl.numberOfPages = viewModel.onboardScreens.count
        
        for index in 0..<viewModel.onboardScreens.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height/3.0))
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: viewModel.onboardScreens[index].image)
            scrollView.addSubview(imageView)
            
            let labelGrande = UILabel(frame: CGRect(x: frame.origin.x, y: frame.size.height/2.5, width: frame.size.width, height: 80))
            labelGrande.numberOfLines = 3
            labelGrande.textAlignment = .center
            labelGrande.font = UIFont.boldSystemFont(ofSize: 30.0)
            labelGrande.text = viewModel.onboardScreens[index].title
            scrollView.addSubview(labelGrande)
            
            let labelPequeño = UILabel(frame: CGRect(x: frame.origin.x, y: frame.size.height/1.6, width: frame.size.width, height: 50))
            labelPequeño.numberOfLines = 3
            labelPequeño.textAlignment = .center
            labelPequeño.text = viewModel.onboardScreens[index].description
            scrollView.addSubview(labelPequeño)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width) * CGFloat(viewModel.onboardScreens.count), height: scrollView.frame.size.height)
        scrollView.isDirectionalLockEnabled = true
    }
    
    // MARK: - ScrollView
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
        if pageControl.currentPage == viewModel.onboardScreens.count-1 {
            self.saltarButton.setTitle("Continuar", for: .normal)
        } else {
            self.saltarButton.setTitle("Saltar", for: .normal)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y>0 || scrollView.contentOffset.y<0 {
            scrollView.contentOffset.y = 0
        }
    }
}
