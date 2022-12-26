//
//  ClockViewModel.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import UIKit

public class ClockViewModel: ClockViewModelProtocol {
    
    public weak var delegate: ClockViewDelegate?
    
    private let formatter: LightDateFormatterProtocol
    private var timer: Timer?
    
    public init(formatter: LightDateFormatterProtocol) {
        self.formatter = formatter
    }
    
    public func startClock() {
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true) { [weak self] _ in
            self?.updateClock(with: .now)
        }
    }
    
    public func stopClock() {
        guard let timer = timer else { return }
        
        timer.invalidate()
    }
    
    public func updateClock(with date: Date) {
        delegate?.refreshClockViews(with: allStatesString(with: date).map(mapColor))
        delegate?.refreshClockLabel(with: DateFormatter.hoursMinutesSecondsFormatter.string(from: date))
    }
    
    private func allStatesString(with date: Date) -> String {
        [formatter.seconds(from: date),
         formatter.fiveHoursRow(from: date),
         formatter.oneHourRow(from: date),
         formatter.fiveMinutesRow(from: date),
         formatter.oneMinuteRow(from: date)
        ].joined()
    }
    
    private func mapColor(_ character: Character) -> UIColor {
        switch character {
        case Character.off: return UIColor.white
        case Character.yellow: return UIColor.yellow
        case Character.red: return UIColor.red
        default: return UIColor.clear
        }
    }
}
