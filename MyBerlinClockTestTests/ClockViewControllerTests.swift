//
//  ClockViewControllerTests.swift
//  MyBerlinClockTestTests
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import XCTest
@testable import MyBerlinClockTest

final class ClockViewControllerTests: XCTestCase {

    func test_checkIfAllViewsArePresent() {
        let vc = ClockViewController()
        
        XCTAssert(vc.allLightViews.count == 24)
    }
}
