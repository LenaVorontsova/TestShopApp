//
//  HomePageViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import UIKit
import SnapKit

final class HomePageViewController: UIViewController {
    weak var coordinator: AppCoordinator?
    var viewModel: HomePageViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
