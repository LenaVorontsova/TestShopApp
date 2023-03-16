//
//  LoginViewModel.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import Foundation

class LoginViewModel {
    var statusText = Dynamic(value: "")
    
    func loginButtonPressed(firstName: String, password: String) {
        if firstName != User.users[0].firstName || password != User.users[0].password {
            statusText.value = "Log in failed!"
        } else {
            statusText.value = "Success!"
        }
    }
}
