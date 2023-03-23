//
//  ProfileViewController.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    private var profileImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "profileImage")
        image.layer.cornerRadius = 10
        image.contentMode = .scaleToFill
        return image
    }()
    private var changePhotoLabel: UILabel = {
        var label = UILabel()
        label.text = "Change photo"
        label.font = .systemFont(ofSize: 7, weight: .medium)
        label.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        return label
    }()
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Satria Adhi Pradana"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(red: 0.247, green: 0.247, blue: 0.247, alpha: 1)
        return label
    }()
    private var uploadButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setTitle("Upload item", for: .normal)
        button.setTitleColor(.white, for: .normal)
        var image = UIImage(named: "uploadImage")
        button.addLeftImage(image: image!, offset: 52)
        button.layer.cornerRadius = 10
        return button
    }()
    private var uploadImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "square.and.arrow.up")
        return image
    }()
    weak var coordinator: AppCoordinator?
    var viewModel: ProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        configureConstraints()
    }
    
    private func configureConstraints() {
        view.backgroundColor = .white
        view.addSubview(profileImage)
        view.addSubview(changePhotoLabel)
        view.addSubview(nameLabel)
        view.addSubview(uploadButton)
        self.uploadButton.addSubview(uploadImage)
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(ProfileConstants.topImage)
            $0.leading.trailing.equalToSuperview().inset(ProfileConstants.offsetImage)
        }
        changePhotoLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(ProfileConstants.changePhotoTop)
            $0.leading.trailing.equalToSuperview().inset(ProfileConstants.changePhotoOffset)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(changePhotoLabel.snp.bottom).offset(ProfileConstants.nameTop)
            $0.leading.trailing.equalToSuperview().inset(ProfileConstants.nameOffset)
        }
        uploadButton.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(ProfileConstants.uploadTop)
            $0.leading.trailing.equalToSuperview().inset(ProfileConstants.uploadOffset)
            $0.bottom.equalToSuperview().inset(ProfileConstants.uploadBottom)
        }
//        uploadImage.snp.makeConstraints {
//            $0.top.equalToSuperview()
//        }
    }
}

extension UIButton {
    func addLeftImage(image: UIImage, offset: CGFloat) {
        self.setImage(image, for: .normal)
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
        self.imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset).isActive = true
    }
}
