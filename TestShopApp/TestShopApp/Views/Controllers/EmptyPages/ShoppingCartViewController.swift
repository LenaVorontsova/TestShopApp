//
//  ShoppingCartViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 19.03.2023.
//

import UIKit

final class ShoppingCartViewController: UIViewController {
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}
