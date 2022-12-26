//
//  UIView+extension.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import UIKit

public extension UIView {
    static func make(border: Border?) -> UIView {
        let view: UIView = .init()
        
        if let border {
            view.layer.borderWidth = border.width
            view.layer.borderColor = border.color
        }
        
        return view
    }
}
