//
//  DeviceDetail-Collection.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 13/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension DeviceDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configure(_ collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailHeaderCollectionCell.self)
        collectionView.register(ProductCollectionCell.self)
        collectionView.register(DeviceCollectionCell.self)
        collectionView.register(supplementaryView: HeaderForCollectionSections.self)
        collectionView.collectionViewLayout = createLayout()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.collectionManager.collectionSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionManager.collectionSections[section].sectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = viewModel.collectionManager.collectionSections[indexPath.section]
        
        switch cellType {
        case .headerSection:
            let cellVM = DetailHeaderCollectionCellViewModel(image: viewModel.device.image, shortDescription: viewModel.device.shortDescription, longDescription: viewModel.device.longDescription)
            let cell = collectionView.dequeue(DetailHeaderCollectionCell.self, for: indexPath, viewModel: cellVM)
            cell.presenter = self
            return cell
        case .productsSection:
            let cellVM = ProductCollectionCellViewModel(product: viewModel.device.products[indexPath.row])
            let cell = collectionView.dequeue(ProductCollectionCell.self, for: indexPath, viewModel: cellVM)
            return cell
        case .devicesSection:
            let cellVM = DeviceCollectionCellViewModel(device: viewModel.device.attachments[indexPath.row])
            let cell = collectionView.dequeue(DeviceCollectionCell.self, for: indexPath, viewModel: cellVM)
            cell.presenter = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellType = viewModel.collectionManager.collectionSections[indexPath.section]
        switch cellType {
        case .productsSection:
            let products = viewModel.device.products
            let productDetailVM = ProductDetailViewModel(product: products[indexPath.row])
            let productDetailVC = UIViewController.instantiate(viewController: ProductDetailViewController.self, withViewModel: productDetailVM)
            push(viewController: productDetailVC)
        default: break
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let sectionLayoutKind = self.viewModel.collectionManager.collectionSections[sectionNumber]
            let noProducts = self.viewModel.device.products.isEmpty
            let noDevices = self.viewModel.device.attachments.isEmpty
            let section: NSCollectionLayoutSection

            switch sectionLayoutKind {
            case .headerSection:
                let heightDimension = NSCollectionLayoutDimension.estimated(500)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: heightDimension)
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: heightDimension)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                section = NSCollectionLayoutSection(group: group)

            case .productsSection:
                let heightDimension = NSCollectionLayoutDimension.estimated(noProducts ? 0 : 230)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noProducts ? 0 : 1.0), heightDimension: .fractionalHeight(noProducts ? 0 : 1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noProducts ? 0 : 0.32), heightDimension: heightDimension)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noProducts ? 0 : 1.0), heightDimension: .estimated(noProducts ? 0 : 44))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                      layoutSize: headerFooterSize,
                      elementKind: MethodologyViewController.sectionHeaderElementKind,
                      alignment: .top)
                section.boundarySupplementaryItems = [sectionHeader]

            case .devicesSection:
                let heightDimension = NSCollectionLayoutDimension.estimated(noDevices ? 0 : 75)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noDevices ? 0 : 1.0), heightDimension: .fractionalHeight(noDevices ? 0 : 1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noDevices ? 0 : 1), heightDimension: heightDimension)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noDevices ? 0 : 1.0), heightDimension: .estimated(noDevices ? 0 : 44))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                      layoutSize: headerFooterSize,
                      elementKind: MethodologyViewController.sectionHeaderElementKind,
                      alignment: .top)
                section.boundarySupplementaryItems = [sectionHeader]
            }

            return section
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      let sectionLayoutKind = self.viewModel.collectionManager.collectionSections[indexPath.section]

      switch sectionLayoutKind {
      case .productsSection(_):
        let headerVM = HeaderForCollectionSectionsViewModel(title: "Productos relacionados:")
        let header = collectionView.dequeue(supplementaryView: HeaderForCollectionSections.self, for: indexPath, viewModel: headerVM)
        return header

      case .devicesSection:
        let headerVM = HeaderForCollectionSectionsViewModel(title: "Accesorios:")
        let header = collectionView.dequeue(supplementaryView: HeaderForCollectionSections.self, for: indexPath, viewModel: headerVM)
        return header

      default:
        return UICollectionReusableView()
      }
    }
}
