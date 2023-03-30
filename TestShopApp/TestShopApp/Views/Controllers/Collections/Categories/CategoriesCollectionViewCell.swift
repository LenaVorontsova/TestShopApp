//
//  CategoriesCollectionViewCell.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 25.03.2023.
//

import UIKit
import SnapKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    static let collectionCellId = "CategoriesCollectionViewCell"
    
    private var icon: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    private var categoryLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 6, weight: .medium)
        let color = UIColor(red: 0.651, green: 0.655, blue: 0.671, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(text: String, image: UIImage) {
        categoryLabel.text = text
        icon.image = image
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(red: 0.933, green: 0.937, blue: 0.957, alpha: 1)
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = true
        
        configureContstrains()
    }
    
    private func configureContstrains() {
        contentView.addSubview(categoryLabel)
        contentView.addSubview(icon)
        categoryLabel.snp.makeConstraints {
            $0.verticalEdges.equalTo(icon.safeAreaLayoutGuide.snp.bottom).inset(CellsConstants.categorieslabelVertical)
            $0.horizontalEdges.equalToSuperview() // .inset(CellsConstants.categorieslabelHorizontal)
        }
        icon.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(CellsConstants.categoriesIconVertical)
            $0.horizontalEdges.equalToSuperview().inset(CellsConstants.categoriesIconHorizontal)
        }
    }
}
