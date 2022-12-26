//
//  MockClockViewController.swift
//  MyBerlinClockTestTests
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import UIKit
@testable import MyBerlinClockTest

public class MockClockViewController: UIViewController {
    
    var refreshClockViewsCallback: (([UIColor]) -> ())?
    var refreshClockLabelCallback: ((String) -> ())?
    
    public var viewModel: ClockViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
}

extension MockClockViewController: ClockViewDelegate {
    public func refreshClockViews(with colors: [UIColor]) {
        refreshClockViewsCallback?(colors)
    }
    
    public func refreshClockLabel(with text: String) {
        refreshClockLabelCallback?(text)
    }
}
