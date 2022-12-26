//
//  Calendar+extension.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

public extension Calendar {
    func seconds(of date: Date) -> Int {
        component(.second, from: date)
    }

    func minutes(of date: Date) -> Int {
        component(.minute, from: date)
    }

    func hours(of date: Date) -> Int {
        component(.hour, from: date)
    }
}
