//
//  DateFormatter+extension.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

public extension DateFormatter {
    static let hoursMinutesSecondsFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        return df
    }()
}
