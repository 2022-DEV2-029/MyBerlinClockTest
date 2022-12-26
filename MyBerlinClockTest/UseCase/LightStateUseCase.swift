//
//  LightStateUseCase.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

public protocol LightStateUseCaseProtocol {
    func secondState(with date: Date) -> Bool
    func fiveHoursRowStates(with date: Date) -> [Bool]
    func oneHourRowStates(with date: Date) -> [Bool]
    func fiveMinutesRowStates(with date: Date) -> [Bool]
    func oneMinuteRowStates(with date: Date) -> [Bool]
}

public class LightStateUseCase: LightStateUseCaseProtocol {

    private var calendar: Calendar = .init(identifier: .gregorian)

    public func secondState(with date: Date) -> Bool {
        calendar.seconds(of: date) % 2 == 0
    }

    public func fiveHoursRowStates(with date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.hours(of: date) / 5)
    }

    public func oneHourRowStates(with date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.hours(of: date) % 5)
    }

    public func fiveMinutesRowStates(with date: Date) -> [Bool] {
        generateStates(for: 11, isOnTotal: calendar.minutes(of: date) / 5)
    }

    public func oneMinuteRowStates(with date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.minutes(of: date) % 5)
    }

    private func generateStates(for numberOfLights: Int, isOnTotal: Int) -> [Bool] {
        Array(repeating: true, count: isOnTotal) + Array(repeating: false, count: numberOfLights - isOnTotal)
    }
}
