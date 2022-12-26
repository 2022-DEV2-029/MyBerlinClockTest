//
//  Character+extension.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

// Possible values
// https://agilekatas.co.uk/katas/BerlinClock-Kata
public extension Character {
    static var off: Character = "O"
    static var yellow: Character = "Y"
    static var red: Character = "R"
}

public extension Array where Element == Character {
    func joined() -> String {
        String(self)
    }
}
