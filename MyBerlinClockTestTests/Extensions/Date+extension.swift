//
//  Date+extension.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

public extension Date {
    static func createWith(calendar: Calendar = .init(identifier: .gregorian),
                           hour: Int = 0,
                           minute: Int = 0,
                           second: Int = 0) -> Self {

        calendar.date(bySettingHour: hour,
                      minute: minute,
                      second: second,
                      of: Date())!
    }
}
