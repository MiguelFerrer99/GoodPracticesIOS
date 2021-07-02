//
//  Date.swift
//  OptimusPlan
//
//  Created by David Alhambra on 6/10/20.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

extension Date {

  init(day: Int, month: Int, year: Int) {
    self.init()

    let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!

    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day

    self = gregorianCalendar.date(from: dateComponents)!
  }

  var day: Int {
    let calendar = Calendar.current
    return calendar.component(.day, from: self)
  }

  var month: Int {
    let calendar = Calendar.current
    return calendar.component(.month, from: self)
  }

  var year: Int {
    let calendar = Calendar.current
    return calendar.component(.year, from: self)
  }

  var stringMonth: String {
    let dateFormatter = DateFormatter()
    dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
    return dateFormatter.string(from: self)
  }

  var monthStringCode: String {
    let dateFormatter = DateFormatter()
    dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
    return dateFormatter.string(from: self)
  }

  func toString(withFormat format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }

  static func minutesBetweenDates(_ oldDate: Date, _ newDate: Date) -> Int {
    let newDateMinutes = newDate.timeIntervalSinceReferenceDate/60
    let oldDateMinutes = oldDate.timeIntervalSinceReferenceDate/60

    return Int(newDateMinutes - oldDateMinutes)
  }
}
