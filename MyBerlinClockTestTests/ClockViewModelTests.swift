//
//  ClockViewModelTests.swift
//  MyBerlinClockTestTests
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import XCTest
@testable import MyBerlinClockTest

final class ClockViewModelTests: XCTestCase {
    
    var vc: MockClockViewController!
    var viewModel: ClockViewModelProtocol!
    
    override func setUp() {
        super.setUp()
        
        vc = MockClockViewController()
        let formatter: LightDateFormatterProtocol = LightDateFormatter(useCase: LightStateUseCase())
        viewModel = ClockViewModel(formatter: formatter)
        vc.viewModel = viewModel
    }
    
    func test_goodColors_expectedResult() {
        let date1: Date = DateFormatter.hoursMinutesSecondsFormatter.date(from: "00:00:00")!
        let date2: Date = DateFormatter.hoursMinutesSecondsFormatter.date(from: "12:00:00")!
        let date3: Date = DateFormatter.hoursMinutesSecondsFormatter.date(from: "23:59:59")!
        let date4: Date = DateFormatter.hoursMinutesSecondsFormatter.date(from: "01:01:01")!
        let date5: Date = DateFormatter.hoursMinutesSecondsFormatter.date(from: "13:46:23")!
        let date6: Date = DateFormatter.hoursMinutesSecondsFormatter.date(from: "10:10:10")!
        
        check(expectedColors: ClockViewModelTests.date1ExpectationColors, for: date1)
        check(expectedColors: ClockViewModelTests.date2ExpectationColors, for: date2)
        check(expectedColors: ClockViewModelTests.date3ExpectationColors, for: date3)
        check(expectedColors: ClockViewModelTests.date4ExpectationColors, for: date4)
        check(expectedColors: ClockViewModelTests.date5ExpectationColors, for: date5)
        check(expectedColors: ClockViewModelTests.date6ExpectationColors, for: date6)
    }
    
    func check(expectedColors: [UIColor], for date: Date) {
        
        let expectation = expectation(description: "Waiting for callback to run")
        
        vc.refreshClockViewsCallback = { colors in
            XCTAssert(colors == expectedColors)
            
            expectation.fulfill()
        }
        
        viewModel.updateClock(with: date)
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func test_clockText_isCorrect() {
        let date: Date = DateFormatter.hoursMinutesSecondsFormatter.date(from: "12:34:56")!
        
        let expectation = expectation(description: "Waiting for callback to run")
        
        vc.refreshClockLabelCallback = { text in
            XCTAssert(text == "12:34:56")
            
            expectation.fulfill()
        }
        
        viewModel.updateClock(with: date)
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}

extension ClockViewModelTests {
    
    static let date1ExpectationColors: [UIColor] = [.yellow,
                                                    .white, .white, .white,.white,
                                                    .white, .white, .white, .white,
                                                    .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white,
                                                    .white, .white, .white, .white]
    
    static let date2ExpectationColors: [UIColor] = [.yellow,
                                                    .red, .red, .white,.white,
                                                    .red, .red, .white, .white,
                                                    .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white,
                                                    .white, .white, .white, .white]
    
    static let date3ExpectationColors: [UIColor] = [.white,
                                                    .red, .red, .red,.red,
                                                    .red, .red, .red, .white,
                                                    .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow,
                                                    .yellow, .yellow, .yellow, .yellow]
    
    static let date4ExpectationColors: [UIColor] = [.white,
                                                    .white, .white, .white,.white,
                                                    .red, .white, .white, .white,
                                                    .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white,
                                                    .yellow, .white, .white, .white]
    
    static let date5ExpectationColors: [UIColor] = [.white,
                                                    .red, .red, .white,.white,
                                                    .red, .red, .red, .white,
                                                    .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow, .red, .white, .white,
                                                    .yellow, .white, .white, .white]
    
    static let date6ExpectationColors: [UIColor] = [.yellow,
                                                    .red, .red, .white,.white,
                                                    .white, .white, .white, .white,
                                                    .yellow, .yellow, .white, .white, .white, .white, .white, .white, .white, .white, .white,
                                                    .white, .white, .white, .white]
}
