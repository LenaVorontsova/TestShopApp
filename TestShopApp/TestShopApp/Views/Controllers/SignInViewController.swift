//
//  SignInViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 18.03.2023.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController {
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Sign in"
        label.font = .systemFont(ofSize: 40, weight: .bold)
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
    private var lastNameTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        textField.placeholder = "Last name"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        return textField
    }()
    private var emailTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        textField.placeholder = "Email"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        return textField
    }()
    private var signInButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    weak var coordinator: AppCoordinator?
    var viewModel: SignInViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureConstraints()
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }
    
    @objc
    func signInButtonPressed() {
        let user = UserData(firstName: firstNameTextField.text,
                            secondName: lastNameTextField.text,
                            email: emailTextField.text)
        viewModel?.model = user
        coordinator?.showTabBar(firstName: firstNameTextField.text!)
    }
    
    private func configureConstraints() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(signInButton)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(LoginConstants.signInTitleTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.titleInset)
        }
        firstNameTextField.snp.makeConstraints {
            $0.height.equalTo(LoginConstants.nameHeight)
            $0.top.equalTo(titleLabel.snp.bottom).offset(LoginConstants.fnTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.nameInset)
        }
        lastNameTextField.snp.makeConstraints {
            $0.height.equalTo(LoginConstants.nameHeight)
            $0.top.equalTo(firstNameTextField.snp.bottom).offset(LoginConstants.snTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.nameInset)
        }
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(LoginConstants.nameHeight)
            $0.top.equalTo(lastNameTextField.snp.bottom).offset(LoginConstants.snTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.nameInset)
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(LoginConstants.signInTop)
            $0.leading.trailing.equalToSuperview().inset(LoginConstants.loginInset)
            $0.bottom.equalToSuperview().inset(LoginConstants.loginBottom)
        }
    }
}
