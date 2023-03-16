//
//  TabBarViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import UIKit
import SnapKit

final class TabBarViewController: UITabBarController {
    var coordinator: AppCoordinator?
    var firstViewModel: FirstPageViewModel?
    var profileViewModel: ProfileViewModel?
    
    init(firstViewModel: FirstPageViewModel,
         profileViewModel: ProfileViewModel,
         coordinator: AppCoordinator) {
        self.firstViewModel = firstViewModel
        self.profileViewModel = profileViewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    private func createTabBar() {
        UITabBar.appearance().backgroundColor = .white
        let profileVC = UINavigationController(rootViewController: ProfileViewController(
            viewModel: profileViewModel!,
            coordinator: coordinator!))
        let firstPageVC = UINavigationController(rootViewController: FirstPageViewController(
            viewModel: firstViewModel!,
            coordinator: coordinator!))
        profileVC.title = "Profile"
        self.setViewControllers([profileVC, firstPageVC], animated: false)
        guard let items = self.tabBar.items else {
            return
        }
        let imagesNames = ["person", "house"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: imagesNames[i])
        }
    }
}
