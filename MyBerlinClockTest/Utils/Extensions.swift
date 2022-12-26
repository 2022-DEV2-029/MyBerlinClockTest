//
//  Extensions.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import UIKit

public struct Border {
    
    public let width: CGFloat
    public let color: CGColor
    
    init(width: CGFloat, color: CGColor) {
        self.width = width
        self.color = color
    }
}

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

public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, layoutMargins: UIEdgeInsets? = nil, insetsLayoutMarginsFromSafeArea: Bool = true) {

        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing

        if let layoutMargins = layoutMargins {
            self.layoutMargins = layoutMargins
            isLayoutMarginsRelativeArrangement = true
        }

        self.insetsLayoutMarginsFromSafeArea = insetsLayoutMarginsFromSafeArea
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
    
    static func createHiddenExpandableView(_ isVertical: Bool) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let axis: NSLayoutConstraint.Axis = isVertical ? .vertical : .horizontal
        view.setContentHuggingPriority(.required, for: axis)
        view.setContentCompressionResistancePriority(.defaultLow, for: axis)
        return view
    }
}

public extension Calendar {
    func seconds(of date: Date) -> Int {
        component(.second, from: date)
    }

    func minutes(of date: Date) -> Int {
        component(.minute, from: date)
    }

    func hours(of date: Date) -> Int {
        component(.hour, from: date)
    }
}
