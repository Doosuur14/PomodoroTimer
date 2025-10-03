//
//  LoginViewController.swift
//  TimerApp
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    var loginView: LoginView?
    var viewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []


    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
        loginView?.login.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

    }
    private func setupVIew() {
        loginView = LoginView(frame: view.bounds)
        view = loginView
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
    }

    @objc private func loginButtonTapped() {
        guard let email = loginView?.email.text, let password = loginView?.password.text else {
            print("Please enter email and password")
            return
        }
            viewModel.login(email: email, password: password)
            configureIO()
    }


    private func configureIO() {
        viewModel.$error.sink { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.navigationController?.pushViewController(MainViewController(), animated: true)
            }

        }.store(in: &cancellables)
    }




}
