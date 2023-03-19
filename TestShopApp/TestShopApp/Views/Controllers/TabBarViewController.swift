//
//  TabBarViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import UIKit
import SnapKit

final class TabBarViewController: UITabBarController {
    weak var coordinator: AppCoordinator?
    var firstViewModel: HomePageViewModel?
    var profileViewModel: ProfileViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    private func createTabBar() {
        UITabBar.appearance().backgroundColor = .white
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        let homePageVC = UINavigationController(rootViewController: HomePageViewController())
        let likedVC = UINavigationController(rootViewController: LikedPageViewController())
        let shoppingVC = UINavigationController(rootViewController: ShoppingCartViewController())
        let messagesVC = UINavigationController(rootViewController: MessagesViewController())
        self.setViewControllers([homePageVC, likedVC, shoppingVC, messagesVC, profileVC], animated: false)
        guard let items = self.tabBar.items else {
            return
        }
        let imagesNames = ["house", "heart", "cart", "message", "person"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: imagesNames[i])
        }
    }
}
