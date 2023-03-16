//
//  ViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 15.03.2023.
//

import UIKit
import SnapKit

enum LoginConstants {
    static let titleTop = 159
    static let titleInset = 100
    
    static let fnTop = 80
    static let nameInset = 42
    static let nameHeight = 30
    
    static let snTop = 35
    
    static let loginTop = 100
    static let loginInset = 43
    static let loginBottom = 315
}

class ViewController: UIViewController {
    var viewModel = LoginViewModel()
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Welcome back!"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    private var firstNameTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        textField.placeholder = "First name"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        return textField
    }()
    private var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        return textField
    }()
    private var logingButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // bindViewModel()
        configureConstraints()
    }
    
    private func configureConstraints() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logingButton)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(LoginConstants.titleTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.titleInset)
        }
        firstNameTextField.snp.makeConstraints {
            $0.height.equalTo(LoginConstants.nameHeight)
            $0.top.equalTo(titleLabel.snp.bottom).offset(LoginConstants.fnTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.nameInset)
        }
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(LoginConstants.nameHeight)
            $0.top.equalTo(firstNameTextField.snp.bottom).offset(LoginConstants.snTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.nameInset)
        }
        logingButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(LoginConstants.loginTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.loginInset)
            $0.bottom.equalToSuperview().inset(LoginConstants.loginBottom)
        }
    }
    
    func bindViewModel() {
//        viewModel.statusText.bind(listener: { statusText in
//            DispatchQueue.main.async {
//                // self.label.text = statusText
//            }
//        })
    }
}
