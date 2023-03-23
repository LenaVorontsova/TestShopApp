//
//  User.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import Foundation

struct User {
    let firstName: String?
    let password: String?
}

extension User {
    static var users = [
        User(firstName: "Satria",
             password: "123456")
    ]
}
