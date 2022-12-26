//
//  ClockViewModelProtocol.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

public protocol ClockViewModelProtocol {
    var delegate: ClockViewDelegate? { get set }
    
    func startClock()
    func stopClock()
    func updateClock(with date: Date)
}
