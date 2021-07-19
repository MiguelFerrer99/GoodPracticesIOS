//
//  AttachmentDetailViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class AttachmentDetailViewModel: ViewModel {
    
    //MARK: - Properties
    let attachment: Device?
    var attachmentDetail: AttachmentDetail?
    
    let attachmentsService = AttachmentsService()

    //MARK: - Initializer
    init(attachmet: Device? = nil, attachmentDetail: AttachmentDetail? = nil) {
      self.attachment = attachmet
      self.attachmentDetail = attachmentDetail
    }
    
    //MARK: - Functions
    func getAttachmentDetails(_ completion: @escaping ((Result<AttachmentDetail, API.NetworkError>) -> Void)) {
      guard attachmentDetail == nil else { return }
      if let id = attachment?.id {
        attachmentsService.getAttachmentDetails(attachmentID: id) { result in
          if case .success(let attachmentDetail) = result {
            self.attachmentDetail = attachmentDetail
          }
          completion(result)
        }
      }
    }
}
