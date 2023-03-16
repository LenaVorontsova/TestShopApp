//
//  AppCoordinator.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var isLoggedIn = false
     
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggedIn {
            showTabBar(firstName: UserData.users[0].firstName!)
        } else {
             showLogin()
        }
    }
    
    func showLogin() {
        let vc = LoginViewController()
        navigationController.pushViewController(vc, animated: false)
        vc.viewModel = LoginViewModel()
        vc.viewModel?.isLoggedIn = isLoggedIn
        vc.coordinator = self
    }
    
    func showTabBar(firstName: String) {
        let firstViewModel = FirstPageViewModel()
        firstViewModel.firstName = firstName
        let profileViewModel = ProfileViewModel()
        profileViewModel.firstName = firstName
        let tabBarVC = TabBarViewController(firstViewModel: firstViewModel,
                                            profileViewModel: profileViewModel,
                                            coordinator: self)
        tabBarVC.modalPresentationStyle = .fullScreen
        // navigationController.viewControllers.removeAll()
        navigationController.pushViewController(tabBarVC, animated: false)
    }
}
