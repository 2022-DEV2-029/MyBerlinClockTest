//
//  LightDateFormatterTests.swift
//  MyBerlinClockTestTests
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import XCTest
@testable import MyBerlinClockTest

final class LightDateFormatterTests: XCTestCase {

    let formatter: LightDateFormatterProtocol = LightDateFormatter(useCase: LightStateUseCase())

    // Seconds
    
    func test_oneSecondLight_expectedResult() {

        // odd
        
        XCTAssert(formatter.seconds(from: Date.createWith(second: 1)) == String.off)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 3)) == String.off)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 5)) == String.off)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 7)) == String.off)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 9)) == String.off)

        // even
        
        XCTAssert(formatter.seconds(from: Date.createWith(second: 0)) == String.yellow)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 2)) == String.yellow)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 4)) == String.yellow)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 6)) == String.yellow)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 8)) == String.yellow)
        XCTAssert(formatter.seconds(from: Date.createWith(second: 10)) == String.yellow)
    }

    // Five hours row
    
    func test_fiveHoursRowLight_expectedResult() {
        checkFiveHoursSatisfy(with: 0...4, expectedResult: "OOOO")
        checkFiveHoursSatisfy(with: 5...9, expectedResult: "ROOO")
        checkFiveHoursSatisfy(with: 10...14, expectedResult: "RROO")
        checkFiveHoursSatisfy(with: 15...19, expectedResult: "RRRO")
        checkFiveHoursSatisfy(with: 20...23, expectedResult: "RRRR")
    }

    func checkFiveHoursSatisfy(with hours: ClosedRange<Int>, expectedResult: String) {
        let results = hours.map { formatter.fiveHoursRow(from: Date.createWith(hour: $0)) }
        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    func test_oneHourLight_expectedResult() {
        checkOneHourSatisfy(with: [0, 5, 10, 15, 20], expectedResult: "OOOO")
        checkOneHourSatisfy(with: [1, 6, 11, 16, 21], expectedResult: "ROOO")
        checkOneHourSatisfy(with: [2, 7, 12, 17, 22], expectedResult: "RROO")
        checkOneHourSatisfy(with: [3, 8, 13, 18, 23], expectedResult: "RRRO")
        checkOneHourSatisfy(with: [4, 9, 14, 19], expectedResult: "RRRR")
    }

    func checkOneHourSatisfy(with hours: [Int], expectedResult: String) {
        let results = hours.map { formatter.oneHourRow(from: Date.createWith(hour: $0)) }
        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    func test_fiveMinutesRowLight_expectedResult() {
        checkFiveMinutesSatisfy(with: 0...4, expectedResult: "OOOOOOOOOOO")
        checkFiveMinutesSatisfy(with: 5...9, expectedResult: "YOOOOOOOOOO")
        checkFiveMinutesSatisfy(with: 10...14, expectedResult: "YYOOOOOOOOO")
        checkFiveMinutesSatisfy(with: 15...19, expectedResult: "YYROOOOOOOO")
        checkFiveMinutesSatisfy(with: 20...24, expectedResult: "YYRYOOOOOOO")
        checkFiveMinutesSatisfy(with: 25...29, expectedResult: "YYRYYOOOOOO")
        checkFiveMinutesSatisfy(with: 30...34, expectedResult: "YYRYYROOOOO")
        checkFiveMinutesSatisfy(with: 35...39, expectedResult: "YYRYYRYOOOO")
        checkFiveMinutesSatisfy(with: 40...44, expectedResult: "YYRYYRYYOOO")
        checkFiveMinutesSatisfy(with: 45...49, expectedResult: "YYRYYRYYROO")
        checkFiveMinutesSatisfy(with: 50...54, expectedResult: "YYRYYRYYRYO")
        checkFiveMinutesSatisfy(with: 55...59, expectedResult: "YYRYYRYYRYY")
    }

    func checkFiveMinutesSatisfy(with minutes: ClosedRange<Int>, expectedResult: String) {
        let results = minutes.map { formatter.fiveMinutesRow(from: Date.createWith(minute: $0)) }

        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    func test_oneMinuteRowLight_expectedResult() {
        checkOneMinuteSatisfy(with: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55],
                              expectedResult: "OOOO")

        checkOneMinuteSatisfy(with: [1, 6, 11, 16, 21, 26, 31, 36, 41, 46, 51, 56],
                              expectedResult: "YOOO")

        checkOneMinuteSatisfy(with: [2, 7, 12, 17, 22, 27, 32, 37, 42, 47, 52, 57],
                              expectedResult: "YYOO")

        checkOneMinuteSatisfy(with: [3, 8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58],
                              expectedResult: "YYYO")

        checkOneMinuteSatisfy(with: [4, 9, 14, 19, 24, 29, 34, 39, 44, 49, 54, 59],
                              expectedResult: "YYYY")
    }

    func checkOneMinuteSatisfy(with minutes: [Int], expectedResult: String) {
        let results = minutes.map { formatter.oneMinuteRow(from: Date.createWith(minute: $0)) }

        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }
}
