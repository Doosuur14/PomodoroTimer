//
//  MainView.swift
//  TimerApp
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import UIKit
import SnapKit

class MainView: UIView {

    var startButtontapped: (() -> Void)?
    var resetButtonTapped: (() -> Void)?
    lazy var selector: UISegmentedControl = UISegmentedControl()
    lazy var timeLabel: UILabel = UILabel()
    lazy var startButton: UIButton = UIButton()
    lazy var resetButton: UIButton = UIButton()
    lazy var tableView: UITableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.setSegmentTitles(titles: ["Pomodoro", "Short Break", "Long Break"])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        setupSegmented()
        setuptimeLabel()
        setupStartButton()
        setupResetButton()

    }

    private func setupSegmented() {
        addSubview(selector)
        selector.selectedSegmentIndex = 0
        selector.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        updateTimerLabelText(for: 0)
        selector.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalTo(70)
            make.height.equalTo(50)
        }
    }

    private func setuptimeLabel() {
        addSubview(timeLabel)
        timeLabel.text = "25:00"
        timeLabel.textColor = .black
        timeLabel.textAlignment = .center
        timeLabel.font = .systemFont(ofSize: 48, weight: .bold)
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-150)
            make.centerX.equalToSuperview().offset(10)
            make.width.equalTo(500)

        }

    }

    private func setupStartButton() {
        addSubview(startButton)
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.clipsToBounds = true
        startButton.backgroundColor = .systemPink
        startButton.layer.cornerRadius = 10
        let action = UIAction { [weak self] _ in
            self?.startButtontapped?()
        }
        startButton.addAction(action, for: .touchUpInside)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(50)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }


    }
    private func setupResetButton() {
        addSubview(resetButton)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.black, for: .normal)
        resetButton.backgroundColor = .systemPink
        resetButton.clipsToBounds = true
        resetButton.layer.cornerRadius = 10
        let action = UIAction { [weak self] _ in
            self?.resetButtonTapped?()
        }
        resetButton.addAction(action, for: .touchUpInside)
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.leading.equalTo(startButton.snp.trailing).offset(15)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
    }

    private func setUpTaskTableView() {
        addSubview(tableView)
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(resetButton.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func setSegmentTitles(titles: [String]) {
        for title in titles {
            selector.insertSegment(withTitle: title, at: selector.numberOfSegments, animated: false)
        }
    }


    private func updateTimerLabelText(for index: Int) {
        switch index {
        case 0:
            timeLabel.text = "25:00"
        case 1:
            timeLabel.text = "5:00"
        case 2:
            timeLabel.text = "15:00"
        default:
            break
        }
    }


    @objc private func segmentedControlValueChanged() {
        let selectedIndex = selector.selectedSegmentIndex
        updateTimerLabelText(for: selectedIndex)
    }
}
