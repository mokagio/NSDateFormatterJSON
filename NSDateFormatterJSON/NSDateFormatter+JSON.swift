//
//  NSDateFormatter+JSON.swift
//  NSDateFormatterJSON
//
//  Created by Giovanni on 12/05/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Foundation

extension NSDateFormatter {
  static func formatterForJSONDate() -> NSDateFormatter {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    return formatter
  }
}
