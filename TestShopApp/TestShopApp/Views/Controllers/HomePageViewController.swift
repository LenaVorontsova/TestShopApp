//
//  HomePageViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import UIKit
import SnapKit

final class HomePageViewController: UIViewController, UISearchBarDelegate {
    private var menuButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "menuImage"), for: .normal)
        return button
    }()
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Trade by bata"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    private var searchBar: UISearchBar = UISearchBar()
    private var categoriesView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var categoriesCollectionView = CategoriesCollectionView()
    private var latestView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var flashSaleView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    weak var coordinator: AppCoordinator?
    var viewModel: HomePageViewModel?
    let categories = ["Phones", "Headphones", "Games", "Cars", "Furniture", "Kids"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "What are you looking for?"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let indexPath = IndexPath(row: categoriesCollectionView.numberOfItems / 2, section: 0)
        self.categoriesCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
    
    private func configureConstraints() {
        view.backgroundColor = .white
        view.addSubview(menuButton)
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(categoriesView)
        categoriesView.addSubview(categoriesCollectionView)
        view.addSubview(latestView)
        view.addSubview(flashSaleView)
        menuButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(HomePageConstants.menuTop)
            $0.leading.equalToSuperview().inset(HomePageConstants.menuLead)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(HomePageConstants.titleTop)
            $0.leading.equalToSuperview().inset(HomePageConstants.titleLead)
            $0.trailing.equalToSuperview().inset(HomePageConstants.titleTrail)
        }
        searchBar.snp.makeConstraints {
            $0.top.equalTo(menuButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        categoriesView.snp.makeConstraints {
            $0.height.equalTo(HomePageConstants.categoriesHeight)
            $0.top.equalTo(searchBar.snp.bottom).inset(HomePageConstants.categoriesTop)
            $0.leading.trailing.equalToSuperview()
        }
        categoriesCollectionView.snp.makeConstraints {
            $0.bottom.top.trailing.leading.equalTo(categoriesView.safeAreaLayoutGuide)
        }
    }
}
