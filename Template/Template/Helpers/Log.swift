//
//  Log.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//
//
//  Log.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum LogType {
  case error
  case info
  case warning
  case debug
  case verbose
}

struct Log {
  static func time() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    return formatter.string(from: date)
  }

  static func this(_ message: String, file: String = #file, function: String = #function, line: Int = #line, type: LogType = .debug) {
    let path = file.split(separator: "/")
    let file = path.last?.split(separator: ".")

    var icon = "📝"
    switch type {
    case .debug:   icon = "💚 DEBUG"
    case .info:    icon = "💙 INFO"
    case .warning: icon = "💛 WARNING"
    case .error:   icon = "❤️ ERROR"
    case .verbose: icon = "💜 VERBOSE"
    }

    print("\(self.time()) \(icon) \(file?.first ?? "").\(function):\(line) - \n\n\t\(message)\n")
  }

  static func thisCall(_ call: URLRequestConvertible) {
    let url     = call.urlRequest?.url?.absoluteString ?? ""
    let headers = call.urlRequest?.allHTTPHeaderFields ?? [:]
    let method  = call.urlRequest?.httpMethod ?? ""
    let params  = String(data: call.urlRequest?.httpBody ?? Data(), encoding: .utf8)

    print("------------------------------------------")
    print("➡️ \(method) \(url) ")
    print("HEADERS: \(headers)")
    print("PARAMETERS: \(params ?? "")")
    print("------------------------------------------")
  }

  static func thisResponse(_ response: AFDataResponse<Any>) {
    let code = response.response?.statusCode ?? 0
    let url  = response.response?.url?.absoluteString ?? ""

    var icon  = ""
    var result: Any = ""
    switch response.result {
    case .success(let data):
      icon  = "✅"
      result = data

    case .failure(let error):
      icon   = "❌"
      result = error.localizedDescription
    }

    print("------------------------------------------")
    print("\(icon) 🔽 [\(code)] \(url)")
    print("VALOR: \(result)")
    print("\(icon) 🔼 [\(code)] \(url)")
    print("------------------------------------------")
  }

  static func thisResponseDecodable<T>(_ response: DataResponse<T, AFError>) {
    let code = response.response?.statusCode ?? 0
    let url  = response.response?.url?.absoluteString ?? ""

    var icon  = ""
    var result: Any = ""
    var errorString: String?
    var errorDetail: Error?

    if let data = response.data {
      result = data.prettyPrintedJSONString ?? ""
    }

    switch response.result {
    case .success(_):
      icon  = "✅"

    case .failure(let error):
      icon   = "❌"
      errorString = error.localizedDescription
      errorDetail = error.underlyingError
    }

    print("------------------------------------------")
    print("\(icon) 🔽 [\(code)] \(url)")
    print("VALOR: \(result)")
    if let errorString = errorString, let errorDetail = errorDetail {
      print("ERROR: \(errorString)")
      print("DETAIL: \(errorDetail)")
    }
    print("\(icon) 🔼 [\(code)] \(url)")
    print("------------------------------------------")
  }

  static func thisError(_ error : Error) {
    print("------------------------------------------")
    print("❌")
    print("ERROR: \(error)")
    print("------------------------------------------")
  }
}

extension Data {
  var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
    guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
      let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
      let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

    return prettyPrintedString
  }
}
