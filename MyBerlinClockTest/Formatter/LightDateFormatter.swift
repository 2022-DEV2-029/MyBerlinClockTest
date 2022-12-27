//
//  LightDateFormatter.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

/**
 This Formatter will return the formatted string for each row thanks to a date.
 Each character represent a color that will be displayed on the different lights.
 */
public protocol LightDateFormatterProtocol {
    func seconds(from date: Date) -> String
    func fiveHoursRow(from date: Date) -> String
    func oneHourRow(from date: Date) -> String
    func fiveMinutesRow(from date: Date) -> String
    func oneMinuteRow(from date: Date) -> String
}

public class LightDateFormatter: LightDateFormatterProtocol {

    private let useCase: LightStateUseCaseProtocol

    public init(useCase: LightStateUseCaseProtocol) {
        self.useCase = useCase
    }

    public func seconds(from date: Date) -> String {
        stringForSecond(isOn: useCase.secondState(from: date))
    }

    public func fiveHoursRow(from date: Date) -> String {
        stringForHour(lightStates: useCase.fiveHoursRowStates(from: date))
    }

    public func oneHourRow(from date: Date) -> String {
        stringForHour(lightStates: useCase.oneHourRowStates(from: date))
    }

    public func fiveMinutesRow(from date: Date) -> String {
        stringForMinutes(lightStates: useCase.fiveMinutesRowStates(from: date),
                         withVisualMarking: true)
    }

    public func oneMinuteRow(from date: Date) -> String {
        stringForMinutes(lightStates: useCase.oneMinuteRowStates(from: date))
    }

    // generate string
    
    private func stringForSecond(isOn: Bool) -> String {
        String(isOn ? Character.yellow : Character.off)
    }

    private func stringForHour(lightStates: [Bool]) -> String {
        lightStates.map { $0 ? Character.red : Character.off }.joined()
    }

    private func stringForMinutes(lightStates: [Bool], withVisualMarking: Bool = false) -> String {

        lightStates.enumerated().map { (index, element) in
            let lightColorOn = (index + 1) % 3 == 0 && withVisualMarking ? Character.red : Character.yellow
            return element ? lightColorOn : Character.off
        }.joined()
    }
}
