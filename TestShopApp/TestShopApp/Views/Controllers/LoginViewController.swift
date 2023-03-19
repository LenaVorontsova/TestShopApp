//
//  LoginViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 15.03.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Welcome back!"
        label.font = .systemFont(ofSize: 26, weight: .bold)
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
    
    var viewModel: LoginViewModel?
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        configureConstraints()
        logingButton.addTarget(self, action: #selector(logingButtonPressed), for: .touchUpInside)
    }
    
    @objc
    func logingButtonPressed() {
        viewModel!.loginButtonPressed(firstName: firstNameTextField.text ?? "",
                                      password: passwordTextField.text ?? "")
        if viewModel!.isLoggedIn {
            coordinator?.isLoggedIn = viewModel!.isLoggedIn
            coordinator?.showTabBar(firstName: firstNameTextField.text ?? "")
        }
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
        viewModel!.statusText.bind(listener: { statusText in
            DispatchQueue.main.async {
                self.showAlert(message: statusText)
            }
        })
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Status",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: false)
    }
}
