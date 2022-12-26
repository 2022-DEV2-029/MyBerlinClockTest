//
//  UIStackView+extension.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import UIKit

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
}
