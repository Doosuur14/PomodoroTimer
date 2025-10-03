//
//  ViewController.swift
//  TimerApp
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    var mainView: MainView?
    var viewModel = MainViewModel()
    private var cancellables: Set<AnyCancellable> = []


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.timerLabel = mainView?.timeLabel.text
        startButtonTapped()
        resetButtonTapped()
        setupBindings()


    }

    private func setupView() {
        mainView = MainView(frame: view.bounds)
        view = mainView
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
    }

    func startButtonTapped() {
        mainView?.startButtontapped = { [weak self] in
            let index = self?.mainView?.selector.selectedSegmentIndex
            self?.viewModel.startButtonTapped(selectedSegmentIndex: index ?? 0)
        }
    }

    func setupBindings() {
        viewModel.$timerLabel
            .sink { [weak self] text in
                self?.mainView?.timeLabel.text = text
            }
            .store(in: &cancellables)
    }
    
    func resetButtonTapped() {
        mainView?.resetButtonTapped = { [weak self] in
            self?.viewModel.resetButtonTapped()
            self?.viewModel.timerLabel = "00:00"
        }

    }


}

