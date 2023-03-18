//
//  SignInViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 18.03.2023.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController {
    weak var coordinator: AppCoordinator?
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
