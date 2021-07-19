//
//  Methodology-Collection.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension MethodologyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configure(_ collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MethodologyHeaderCollectionCell.self)
        collectionView.register(ProductCollectionCell.self)
        collectionView.register(DeviceCollectionCell.self)
        collectionView.register(StepCollectionCell.self)
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
            if let name = viewModel.methodology.name,
            let subtitle = viewModel.methodology.subtitle,
            let shortDescription = viewModel.methodology.shortDescription,
            let image = viewModel.methodology.image,
            let longDescription = viewModel.methodology.longDescription {
                let cellVM = MethodologyHeaderCollectionCellViewModel(title: name, type: subtitle, description: shortDescription, image: image, longDescription: longDescription)
                let cell = collectionView.dequeue(MethodologyHeaderCollectionCell.self, for: indexPath, viewModel: cellVM)
                return cell
            }
            return UICollectionViewCell()
            
        case .productsSection:
            if let products = viewModel.methodology.products {
                let cellVM = ProductCollectionCellViewModel(product: products[indexPath.row])
                let cell = collectionView.dequeue(ProductCollectionCell.self, for: indexPath, viewModel: cellVM)
                return cell
            }
            return UICollectionViewCell()

        case .devicesSection:
            if let devices = viewModel.methodology.devices {
                let cellVM = DeviceCollectionCellViewModel(device: devices[indexPath.row])
                let cell = collectionView.dequeue(DeviceCollectionCell.self, for: indexPath, viewModel: cellVM)
                cell.presenter = self
                return cell
            }
            return UICollectionViewCell()

        case .stepsSection:
            if let steps = viewModel.methodology.steps {
                let cellVM = StepCollectionCellViewModel(step: steps[indexPath.row], totalSteps: steps.count, actualStep: indexPath.row+1)
                let cell = collectionView.dequeue(StepCollectionCell.self, for: indexPath, viewModel: cellVM)
                return cell
            }
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellType = viewModel.collectionManager.collectionSections[indexPath.section]
        
        switch cellType {
        case .productsSection(_):
            if let products = viewModel.methodology.products {
                let productDetailVM = ProductDetailViewModel(product: products[indexPath.row])
                let productDetailVC = UIViewController.instantiate(viewController: ProductDetailViewController.self, withViewModel: productDetailVM)
                push(viewController: productDetailVC)
            }
            
        default: break
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
      return UICollectionViewCompositionalLayout { (sectionNumber: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

        let sectionLayoutKind = self.viewModel.collectionManager.collectionSections[sectionNumber]
        let section: NSCollectionLayoutSection
        
        let noProducts = self.viewModel.methodology.products?.isEmpty ?? true
        let noDevices = self.viewModel.methodology.devices?.isEmpty ?? true
        let noSteps = self.viewModel.methodology.steps?.isEmpty ?? true

        switch sectionLayoutKind {
        case .headerSection:
            let heightDimension = NSCollectionLayoutDimension.estimated(300)
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
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary //--> Scroll continuo pero no se queda en mitad de un item
            //section.orthogonalScrollingBehavior = .continuous //--> Scroll continuo, se puede quedar en mitad de un item
            //section.orthogonalScrollingBehavior = .paging     //--> Scroll paginado, se forman X páginas dependiendo los items dentro de una página
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
        
        case .stepsSection:
            let heightDimension = NSCollectionLayoutDimension.estimated(noSteps ? 0 : 300)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noSteps ? 0 : 1.0), heightDimension: heightDimension)
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noSteps ? 0 : 1.0), heightDimension: heightDimension)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: noSteps ? 0 : 1)
            section = NSCollectionLayoutSection(group: group)
            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(noSteps ? 0 : 1.0), heightDimension: .estimated(noSteps ? 0 : 44))
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
        let headerVM = HeaderForCollectionSectionsViewModel(title: "Lista de productos:")
        let header = collectionView.dequeue(supplementaryView: HeaderForCollectionSections.self, for: indexPath, viewModel: headerVM)
        return header

      case .devicesSection:
        let headerVM = HeaderForCollectionSectionsViewModel(title: "Aparatos:")
        let header = collectionView.dequeue(supplementaryView: HeaderForCollectionSections.self, for: indexPath, viewModel: headerVM)
        return header
        
      case .stepsSection:
        let headerVM = HeaderForCollectionSectionsViewModel(title: "Pasos:")
        let header = collectionView.dequeue(supplementaryView: HeaderForCollectionSections.self, for: indexPath, viewModel: headerVM)
        return header

      default:
        return UICollectionReusableView()
      }
    }
}
