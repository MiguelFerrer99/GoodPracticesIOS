//
//  API.swift
//  Reservapp
//
//  Created by Toni García Alhambra on 12/10/2019.
//  Copyright © 2019 rudo. All rights reserved.
//

import Foundation
import Alamofire

class API {

  enum NetworkError: Error {
    case badRequest
    case mapFailed
    case badResponse
    case invalidCredentials
    case notFound
    case customMessage(String)

    var localizedDescription: String {
      switch self {
      case .badRequest: return "Incorrect format in the call"
      case .mapFailed: return "Object Mapper failed"
      case .badResponse: return "Bad response"
      case .invalidCredentials: return "No active account found with the given credentials"
      case .notFound: return "Data not found"
      case .customMessage(let message): return message
      }
    }
  }

  static let session = Session(interceptor: RequestInterceptor())

  static var shared = API()

  /// This function upload images and videos in the URLRequest given.
  ///
  /// - Parameters:
  ///   - URLRequest: The URLRequest to upload the data.
  ///   - images: The images parameter to upload.
  ///   - videos: The videos parameter to upload.
  ///   - completion: The completion for the response.
  func callDecoding<T: Decodable>(_ URLRequest: URLRequestConvertible, of type: T.Type, images: [String: UIImage] = [:], videos: [String: String] = [:], completion: @escaping (Result<T, NetworkError>) -> Void) {

    API.session.upload(multipartFormData: { (multipartFormData) in
      for (key, image) in images {
        if let imageData = image.jpegData(compressionQuality: 0.1) {
          multipartFormData.append(imageData, withName: key, fileName: "img.jpg", mimeType: "image/jpeg")
        }
      }

      for (key, filePath) in videos {
        if let fileData = try? NSData(contentsOfFile: filePath) as Data {
          let ext = filePath.split(separator: ".").last ?? "MOV"
          multipartFormData.append(fileData, withName: key, fileName: "file.\(ext)", mimeType: "video/*")
        }
      }

      if let body = URLRequest.urlRequest?.httpBody, let params = try? JSONSerialization.jsonObject(with: body) as? [String: Any] {
        for (key, value) in params {
          multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
        }
      }
    }, to: (URLRequest.urlRequest?.url?.absoluteString)!, method: HTTPMethod(rawValue: (URLRequest.urlRequest?.httpMethod)!), headers: URLRequest.urlRequest?.headers)
    .validate()
    .responseDecodable(of: type) { response in

      Log.thisResponseDecodable(response)

      switch response.result {
      case .success(_):
        switch response.response?.statusCode ?? 0 {
        case 200 ..< 300:
          guard let object = response.value else {
            completion(.failure(.mapFailed))
            return
          }

          completion(.success(object))

        default:
          completion(.failure(.badResponse))
        }

      case .failure(_):
        switch response.response?.statusCode {
        case 404:
          completion(.failure(.notFound))

        default:
          completion(.failure(.badResponse))
        }
      }
    }
  }

  func auth<T: Decodable>(_ URLRequest: URLRequestConvertible, of type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {

    let request = try! URLRequest.asURLRequest()

    API.session.request(request).responseDecodable(of: type) { response in
      Log.thisResponseDecodable(response)

      switch response.result {
      case .success(_):
        switch response.response?.statusCode ?? 0 {
        case 200 ..< 300:
          guard let object = response.value else {
            completion(.failure(.mapFailed))
            return
          }

          completion(.success(object))

        case 404:
          completion(.failure(.invalidCredentials))

        default:
          completion(.failure(.badResponse))
        }

      case .failure(_): completion(.failure(.badResponse))
      }
    }
  }
}
