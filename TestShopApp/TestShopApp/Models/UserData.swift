//
//  UserData.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import Foundation

struct UserData {
    let firstName: String?
    let secondName: String?
    let email: String?
}

extension UserData {
    static var users = [
        UserData(firstName: "Satria",
                 secondName: "Adhi Pradana",
                 email: "test@email.com")
    ]
}
