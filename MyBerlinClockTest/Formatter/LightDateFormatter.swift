//
//  LightDateFormatter.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

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
        stringForSecond(isOn: useCase.secondState(with: date))
    }

    public func fiveHoursRow(from date: Date) -> String {
        stringForHour(lightStates: useCase.fiveHoursRowStates(with: date))
    }

    public func oneHourRow(from date: Date) -> String {
        stringForHour(lightStates: useCase.oneHourRowStates(with: date))
    }

    public func fiveMinutesRow(from date: Date) -> String {
        stringForMinutes(lightStates: useCase.fiveMinutesRowStates(with: date),
                         withVisualMarking: true)
    }

    public func oneMinuteRow(from date: Date) -> String {
        stringForMinutes(lightStates: useCase.oneMinuteRowStates(with: date))
    }

    // generate string
    
    private func stringForSecond(isOn: Bool) -> String {
        isOn ? String.yellow : String.off
    }

    private func stringForHour(lightStates: [Bool]) -> String {
        lightStates.map { $0 ? String.red : String.off }.joined()
    }

    private func stringForMinutes(lightStates: [Bool], withVisualMarking: Bool = false) -> String {

        lightStates.enumerated().map { (index, element) in
            let lightColor = (index + 1) % 3 == 0 && withVisualMarking ? String.red : String.yellow
            return element ? lightColor : String.off
        }.joined()
    }
}
