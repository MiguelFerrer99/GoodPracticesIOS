//
//  AttachmentDetail-Collection.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

extension AttachmentDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
  func configure(_ collectionView: UICollectionView) {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(DetailHeaderCollectionCell.self)
    collectionView.collectionViewLayout = createLayout()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellVM = DetailHeaderCollectionCellViewModel(image: viewModel.attachment?.image ?? viewModel.attachmentDetail?.image, shortDescription: viewModel.attachmentDetail?.shortDescription ?? "", longDescription: viewModel.attachmentDetail?.longDescription ?? "", url: viewModel.attachmentDetail?.buyLink ?? "")
      let cell = collectionView.dequeue(DetailHeaderCollectionCell.self, for: indexPath, viewModel: cellVM)
      cell.presenter = self
      return cell
  }

  private func createLayout() -> UICollectionViewLayout {
    return UICollectionViewCompositionalLayout { (sectionNumber: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

      let section: NSCollectionLayoutSection

      let heightDimension = NSCollectionLayoutDimension.estimated(300)

      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: heightDimension)

      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: heightDimension)

      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

      section = NSCollectionLayoutSection(group: group)

      return section
    }
  }
}
