//
//  ClockViewController.swift
//  MyBerlinClockTest
//
//  Created by 2022-DEV2-029 on 26/12/2022.
//

import UIKit

public class ClockViewController: UIViewController {
    
    // Views
    
    private lazy var secondsView: UIView = UIView.make(border: border)
    private lazy var secondsViewContainer: UIView = .init()
    
    private lazy var rowFiveHoursViews: [UIView] = generateViews(number: 4)
    private lazy var rowOneHourViews: [UIView] = generateViews(number: 4)
    private lazy var rowFiveMinutesViews: [UIView] = generateViews(number: 11)
    private lazy var rowOneMinuteViews: [UIView] = generateViews(number: 4)
    
    private lazy var mainVerticalStackView: UIStackView = .init(axis: .vertical, spacing: spacingVertical, layoutMargins: layoutMargins)
    
    private lazy var fiveHoursStackView: UIStackView = .init(axis: .horizontal, distribution: .fillEqually, spacing: spacingHorizontal)
    private lazy var oneHourStackView: UIStackView = .init(axis: .horizontal, distribution: .fillEqually, spacing: spacingHorizontal)
    private lazy var fiveMinutesStackView: UIStackView = .init(axis: .horizontal, distribution: .fillEqually, spacing: spacingHorizontal)
    private lazy var oneMinuteStackView: UIStackView = .init(axis: .horizontal, distribution: .fillEqually, spacing: spacingHorizontal)
    
    private lazy var clockLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "--:--:--"
        label.textAlignment = .center
        return label
    }()
    
    lazy var allLightViews: [UIView] = [[secondsView],
                                        rowFiveHoursViews,
                                        rowOneHourViews,
                                        rowFiveMinutesViews,
                                        rowOneMinuteViews].flatMap { $0 }
    
    // Miscellaneous visuals
    
    private let border: Border = .init(width: 3, color: UIColor.black.cgColor)
    private let heightSecondRow: CGFloat = 130
    private let heightRow: CGFloat = 75
    private let spacingVertical: CGFloat = 12
    private let spacingHorizontal: CGFloat = 8
    private let layoutMargins: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
    
    // ViewModel
    
    public var viewModel: ClockViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // Functions
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel?.startClock()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel?.stopClock()
    }
    
    // UI setup
    
    private func setupViews() {
        addMainStackView()
        addRowsInMainStackView()
        setupConstraints()
        
        secondsView.layoutIfNeeded()
        secondsView.layer.cornerRadius = secondsView.layer.bounds.width / 2
        secondsView.clipsToBounds = true
    }
    
    private func addMainStackView() {
        view.addSubview(mainVerticalStackView)
        
        mainVerticalStackView.addArrangedSubviews([secondsViewContainer,
                                                   fiveHoursStackView,
                                                   oneHourStackView,
                                                   fiveMinutesStackView,
                                                   oneMinuteStackView,
                                                   clockLabel])
    }
    
    private func addRowsInMainStackView() {
        
        // Embed SecondsView in container
        secondsViewContainer.addSubview(secondsView)
        
        // Horizontal StackViews
        fiveHoursStackView.addArrangedSubviews(rowFiveHoursViews)
        oneHourStackView.addArrangedSubviews(rowOneHourViews)
        fiveMinutesStackView.addArrangedSubviews(rowFiveMinutesViews)
        oneMinuteStackView.addArrangedSubviews(rowOneMinuteViews)
    }
    
    private func setupConstraints() {
        
        // Main StackView
        mainVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainVerticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainVerticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainVerticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        // SecondsView
        
        secondsView.translatesAutoresizingMaskIntoConstraints = false
        secondsView.centerXAnchor.constraint(equalTo: secondsViewContainer.centerXAnchor).isActive = true
        secondsView.topAnchor.constraint(equalTo: secondsViewContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        secondsView.bottomAnchor.constraint(equalTo: secondsViewContainer.safeAreaLayoutGuide.bottomAnchor).isActive = true
        secondsView.heightAnchor.constraint(equalToConstant: heightSecondRow).isActive = true
        secondsView.widthAnchor.constraint(equalToConstant: heightSecondRow).isActive = true
        
        // Horizontal StackViews
        fiveHoursStackView.heightAnchor.constraint(equalToConstant: heightRow).isActive = true
        oneHourStackView.heightAnchor.constraint(equalToConstant: heightRow).isActive = true
        fiveMinutesStackView.heightAnchor.constraint(equalToConstant: heightRow).isActive = true
        oneMinuteStackView.heightAnchor.constraint(equalToConstant: heightRow).isActive = true
    }
    
    private func generateViews(number: Int) -> [UIView] {
        (0..<number).map { _ in UIView.make(border: border) }
    }
}

extension ClockViewController: ClockViewDelegate {
    public func refreshClockViews(with colors: [UIColor]) {
        zip(allLightViews, colors).forEach { $0.0.backgroundColor = $0.1 }
    }
    
    public func refreshClockLabel(with text: String) {
        clockLabel.text = text
    }
}
