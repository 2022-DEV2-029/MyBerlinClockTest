//
//  LightStateUseCase.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

/**
 This UseCase will return all the states of each light.
 If it is illuminated, it wiil return true, if not false.
 */
public protocol LightStateUseCaseProtocol {
    func secondState(from date: Date) -> Bool
    func fiveHoursRowStates(from date: Date) -> [Bool]
    func oneHourRowStates(from date: Date) -> [Bool]
    func fiveMinutesRowStates(from date: Date) -> [Bool]
    func oneMinuteRowStates(from date: Date) -> [Bool]
}

public class LightStateUseCase: LightStateUseCaseProtocol {

    private var calendar: Calendar = .init(identifier: .gregorian)

    public func secondState(from date: Date) -> Bool {
        calendar.seconds(of: date) % 2 == 0
    }

    public func fiveHoursRowStates(from date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.hours(of: date) / 5)
    }

    public func oneHourRowStates(from date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.hours(of: date) % 5)
    }

    public func fiveMinutesRowStates(from date: Date) -> [Bool] {
        generateStates(for: 11, isOnTotal: calendar.minutes(of: date) / 5)
    }

    public func oneMinuteRowStates(from date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.minutes(of: date) % 5)
    }

    private func generateStates(for numberOfLights: Int, isOnTotal: Int) -> [Bool] {
        Array(repeating: true, count: isOnTotal) + Array(repeating: false, count: numberOfLights - isOnTotal)
    }
}
