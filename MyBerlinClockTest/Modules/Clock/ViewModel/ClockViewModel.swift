//
//  ClockViewModel.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import Foundation

public class ClockViewModel: ClockViewModelProtocol {
    
    public weak var delegate: ClockViewDelegate?
    
    private var timer: Timer?
    
    public init() { }
    
    public func startClock() {
            timer = Timer.scheduledTimer(withTimeInterval: 1,
                                         repeats: true) { [weak self] _ in
                self?.updateClock()
            }
        }

        public func stopClock() {
            guard let timer = timer else { return }

            timer.invalidate()
        }

        public func updateClock() {
            // Update UI of the clock
            
            print("coucou updateClock")
        }
}
