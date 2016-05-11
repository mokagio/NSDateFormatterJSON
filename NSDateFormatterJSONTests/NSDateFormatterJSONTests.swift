//
//  NSDateFormatterJSONTests.swift
//  NSDateFormatterJSONTests
//
//  Created by Giovanni on 12/05/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import XCTest
@testable import NSDateFormatterJSON

class NSDateFormatterJSONTests: XCTestCase {
  let sut = NSDateFormatter.formatterForJSONDate()

  var testDate: NSDate {
    let components = NSDateComponents()
    components.calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
    components.timeZone = NSTimeZone(forSecondsFromGMT: 0)
    components.year = 2016
    components.month = 5
    components.day = 12
    components.hour = 5
    components.minute = 11
    components.second = 42
    components.nanosecond = 987 * 1000000

    guard let date = components.date else {
      preconditionFailure("Could not init NSDate from NSDateComponents")
    }

    return date
  }

  func testToString() {
    XCTAssertEqual(sut.stringFromDate(testDate), "2016-05-12T05:11:42.987Z")
  }

  func testStringToDate() {
    XCTAssertEqual(sut.dateFromString("2016-05-12T05:11:42.987Z"), testDate)
  }

  // The tests above are using a fixed value, so they might be passing by chance.
  // This test here uses the current time, so every time it runs it uses a
  // different value. On top of that, it tests the behaviour of the code as a
  // property: the date from string of a string from date x should equal x.
  func testProperty() {
    let now = NSDate()
    let nowToJSON = sut.stringFromDate(now)
    XCTAssertEqualWithAccuracy(sut.dateFromString(nowToJSON)!.timeIntervalSince1970, now.timeIntervalSince1970, accuracy: 0.001)
  }
}
