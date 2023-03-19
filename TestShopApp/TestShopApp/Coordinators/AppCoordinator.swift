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
            showSignIn()
             // showLogin()
        }
    }
    
    func showLogin() {
        let vc = LoginViewController()
        let viewModel = LoginViewModel()
        vc.viewModel = viewModel
        vc.viewModel?.isLoggedIn = isLoggedIn
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showTabBar(firstName: String) {
        let firstViewModel = FirstPageViewModel()
        firstViewModel.firstName = firstName
        let profileViewModel = ProfileViewModel()
        profileViewModel.firstName = firstName
        let tabBarVC = TabBarViewController()
        tabBarVC.firstViewModel = firstViewModel
        tabBarVC.profileViewModel = profileViewModel
        tabBarVC.coordinator = self
        tabBarVC.modalPresentationStyle = .fullScreen
        // navigationController.viewControllers.removeAll()
        navigationController.pushViewController(tabBarVC, animated: false)
    }
    
    func showSignIn() {
        let viewModel = SignInViewModel()
        let vc = SignInViewController()
        vc.viewModel = viewModel
        viewModel.model = UserData.users[0]
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showFirstPage() {
        let viewModel = FirstPageViewModel()
        let vc = FirstPageViewController()
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showDetails() {
        let viewModel = DetailViewModel()
        let vc = DetailViewController()
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
