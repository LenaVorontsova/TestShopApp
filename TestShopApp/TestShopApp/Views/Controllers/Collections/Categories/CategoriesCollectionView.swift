//
//  CategoriesCollectionView.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 25.03.2023.
//

import UIKit
import SnapKit

final class CategoriesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let numberOfItems = 1000
    let categoriesLabels = ["Phones", "Headphones", "Games", "Cars", "Furniture", "Kids"]
    let categoriesIcons = [UIImage(named: "phoneImage"),
                           UIImage(named: "headphonesImage"),
                           UIImage(named: "gamesImage"),
                           UIImage(named: "carsImage"),
                           UIImage(named: "furnitureImage"),
                           UIImage(named: "kidsImage")]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        self.showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(CategoriesCollectionViewCell.self,
                 forCellWithReuseIdentifier: CategoriesCollectionViewCell.collectionCellId)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoriesCollectionViewCell.collectionCellId,
            for: indexPath) as? CategoriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(text: categoriesLabels[indexPath.row % categoriesLabels.count],
                           image: categoriesIcons[indexPath.row % categoriesIcons.count]!)
        return cell
    }
}
