//
//  AttachmentDetail-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class AttachmentDetailViewController: ViewController, ViewModelController {
  typealias T = AttachmentDetailViewModel

  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!

  // MARK: - Properties
  var viewModel: AttachmentDetailViewModel! {
    didSet { fillUI() }
  }
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    setUpUI()
  }

  // MARK: - Functions
  func setUpUI() {
    configure(collectionView)

    var shareButton = UIBarButtonItem()
    shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonPressed))
    shareButton.tintColor = #colorLiteral(red: 0, green: 0.05099999905, blue: 0.1490000039, alpha: 1)

    navigationItem.rightBarButtonItem = shareButton
  }

  func fillUI() {
    viewModel.getAttachmentDetails { result in
      if case .success(_) = result {
        self.collectionView.reloadData()
      }
    }
  }
  
  // MARK: - Observers
  @objc func shareButtonPressed(sender: UIButton) {
    guard let id = viewModel.attachmentDetail?.id else { return }

    let text = "https://cleanapp.rudo.es/attachment/\(id)"

    let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
    activityViewController.popoverPresentationController?.sourceView = self.view

    self.present(activityViewController, animated: true, completion: nil)
  }
}
