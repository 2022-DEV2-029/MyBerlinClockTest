//
//  ViewControllerTests.swift
//  MyBerlinClockTestTests
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import XCTest
@testable import MyBerlinClockTest

final class ViewControllerTests: XCTestCase {

    func test_checkIfAllViewsArePresent() {
        let viewController = ViewController()
        
        XCTAssert(viewController.allLightViews.count == 24)
    }
}
