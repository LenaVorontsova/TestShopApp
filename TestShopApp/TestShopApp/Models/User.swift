//
//  User.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import Foundation

struct User {
    let firstName: String?
    let secondName: String?
    let email: String?
    let password: String?
}

extension User {
    static var users = [
        User(firstName: "Lena",
             secondName: "Vorontsova",
             email: "test@email.com",
             password: "123456")
    ]
}
