//
//  Attachments-Service.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class AttachmentsService {
    
  func getAttachmentDetails(attachmentID: String, completionHandler: @escaping ((Result<AttachmentDetail, API.NetworkError>) -> Void)) {
    API.shared.callDecoding(AttachmentsAPI.getAttachmentDetail(attachmentID), of: AttachmentDetail.self, completion: completionHandler)
  }
}
