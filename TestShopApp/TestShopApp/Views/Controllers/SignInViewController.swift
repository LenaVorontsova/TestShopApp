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
    private var questionLabel: UILabel = {
        var label = UILabel()
        label.text = "Already have an account?"
        label.font = .systemFont(ofSize: 10, weight: .thin)
        label.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        return label
    }()
    private var logInButton: UIButton = {
        var button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor(red: 0.145, green: 0.31, blue: 0.902, alpha: 1),
                             for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.titleLabel?.textAlignment = .left
        return button
    }()
    private var googleButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "googleIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    private var appleButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "appleIcon"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        return button
    }()
    private var googleLabel: UILabel = {
        var label = UILabel()
        label.text = "Sign in with Google"
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textColor = .black
        return label
    }()
    private var appleLabel: UILabel = {
        var label = UILabel()
        label.text = "Sign in with Apple"
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    weak var coordinator: AppCoordinator?
    var viewModel: SignInViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureConstraints()
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
    }
    
    @objc
    func signInButtonPressed() {
        let user = UserData(firstName: firstNameTextField.text,
                            secondName: lastNameTextField.text,
                            email: emailTextField.text)
        viewModel?.model = user
        coordinator?.showTabBar(firstName: firstNameTextField.text!)
    }
    
    @objc
    func logInButtonPressed() {
        coordinator?.showLogin()
    }
    
    private func configureConstraints() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(signInButton)
        view.addSubview(questionLabel)
        view.addSubview(logInButton)
        view.addSubview(googleButton)
        view.addSubview(googleLabel)
        view.addSubview(appleButton)
        view.addSubview(appleLabel)
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
        }
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(LoginConstants.questionTop)
            $0.leading.equalToSuperview().inset(LoginConstants.loginInset)
        }
        logInButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(LoginConstants.buttonTop)
            $0.leading.equalTo(questionLabel.snp.trailing).offset(LoginConstants.logLead)
            $0.trailing.equalToSuperview().inset(LoginConstants.questionTrailling)
        }
        googleButton.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(LoginConstants.googleTop)
            $0.leading.equalToSuperview().inset(LoginConstants.googleLead)
        }
        googleLabel.snp.makeConstraints {
            $0.top.equalTo(logInButton.snp.bottom).offset(LoginConstants.googleTextTop)
            $0.leading.equalTo(googleButton.snp.trailing).offset(LoginConstants.googleTextLead)
            $0.trailing.equalToSuperview().inset(LoginConstants.googleTextTrail)
        }
        appleButton.snp.makeConstraints {
            $0.top.equalTo(googleButton.snp.bottom).offset(LoginConstants.appleTop)
            $0.leading.equalToSuperview().inset(LoginConstants.appleLead)
            $0.trailing.equalToSuperview().inset(LoginConstants.googleTrail)
            $0.bottom.equalToSuperview().inset(LoginConstants.appleBottom)
        }
        appleLabel.snp.makeConstraints {
            $0.top.equalTo(googleLabel.snp.bottom).offset(LoginConstants.appleTextTop)
            $0.leading.equalTo(appleButton.snp.trailing).offset(LoginConstants.appleTextLead)
            $0.trailing.equalToSuperview().inset(LoginConstants.appleTextTrail)
            $0.bottom.equalToSuperview().inset(LoginConstants.appleTextBottom)
        }
    }
}
