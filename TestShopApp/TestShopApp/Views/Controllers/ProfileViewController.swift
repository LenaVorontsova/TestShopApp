//
//  ProfileViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    weak var coordinator: AppCoordinator?
    var viewModel: ProfileViewModel?
    
//    init(viewModel: ProfileViewModel, coordinator: AppCoordinator) {
//        self.viewModel = viewModel
//        self.coordinator = coordinator
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
