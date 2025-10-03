//
//  TimerAppTest.swift
//  TimerAppTest
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import XCTest
@testable import TimerApp

final class TimerAppTest: XCTestCase {

     lazy var  viewModel = LoginViewModel()
     lazy var  userService  = UserService()

    func test_user_login_success() throws {
        let email = "doosuur14@gmail.com"
                let password = "12345"
        userService.login(email: email, password: password) { result in
        switch result {

            case .success(let user):
            XCTAssertEqual(user.email, email)
            XCTAssertEqual(user.password, password)
            case .failure(let error):
            XCTFail("Login should not fail. Error: \(error)")
        }
    }

  }

}
