//
//  ClockViewDelegate.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import UIKit

public protocol ClockViewDelegate: AnyObject {
    func refreshClockViews(with colors: [UIColor])
    func refreshClockLabel(with text: String)
}
