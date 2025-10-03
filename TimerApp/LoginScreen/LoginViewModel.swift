//
//  LoginViewModel.swift
//  TimerApp
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import Foundation

final class LoginViewModel {

    @Published var error: String?

    func login(email: String, password: String) {
        UserService.shared.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                print("User successfully logged in!")
            case .failure:
                print("Login failed")
                self?.error = "Invalid email and password."
            }
        }
    }
}
