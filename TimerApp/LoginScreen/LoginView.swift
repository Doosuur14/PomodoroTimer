//
//  LoginView.swift
//  TimerApp
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import UIKit

class LoginView: UIView {


    lazy var appName: UILabel = UILabel()
    lazy var email: UITextField = UITextField()
    lazy var password: UITextField = UITextField()
    lazy var login: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpfunc()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpfunc() {
        setupAppName()
        setupEmail()
        setupPassword()
        setupLoginButton()
    }

    private func setupAppName() {
        addSubview(appName)
        appName.text = "Pomodoro Timer"
        appName.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        appName.textColor = .systemPink
        appName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(-10)
            make.centerX.equalToSuperview()
        }
    }

    private func setupEmail() {
        addSubview(email)
        email.placeholder = "Email"
        email.backgroundColor = .clear
        email.borderStyle = .roundedRect
        email.autocapitalizationType = .none
        email.textColor = .black
        email.snp.makeConstraints { make in
            make.top.equalTo(appName.snp.top).offset(70)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setupPassword() {
        addSubview(password)
        password.placeholder = "Password"
        password.backgroundColor = .clear
        password.borderStyle = .roundedRect
        password.textColor = .black
        password.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setupLoginButton() {
        addSubview(login)
        login.setTitle("Login", for: .normal)
        login.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        login.isEnabled = true
        login.backgroundColor = .systemPink
        login.clipsToBounds = true
        login.layer.cornerRadius = 10
        login.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }


}
