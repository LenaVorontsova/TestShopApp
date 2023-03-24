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
    // StackView buttons
    private var traidStoreButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.addLeftTitle(titleText: "    Traid store", offset: 80)
        button.setTitleColor(.black, for: .normal)
        var image = UIImage(named: "cardImage")
        button.addLeftImage(image: image!, offset: 52)
        return button
    }()
    private var paymentButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.addLeftTitle(titleText: "    Payment method", offset: 80)
        button.setTitleColor(.black, for: .normal)
        var image = UIImage(named: "cardImage")
        button.addLeftImage(image: image!, offset: 52)
        return button
    }()
    private var balanceButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.addLeftTitle(titleText: "    Balance", offset: 80)
        button.setTitleColor(.black, for: .normal)
        var image = UIImage(named: "cardImage")
        button.addLeftImage(image: image!, offset: 52)
        return button
    }()
    private var traidHistoryButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.addLeftTitle(titleText: "    Traid history", offset: 80)
        button.setTitleColor(.black, for: .normal)
        var image = UIImage(named: "cardImage")
        button.addLeftImage(image: image!, offset: 52)
        return button
    }()
    private var restoreButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addLeftTitle(titleText: "    Restore purchase", offset: 80)
         var image = UIImage(named: "restoreImage")
         button.addLeftImage(image: image!, offset: 52)
        return button
    }()
    private var helpButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.addLeftTitle(titleText: "    Help", offset: 80)
        button.setTitleColor(.black, for: .normal)
        var image = UIImage(named: "helpImage")
        button.addLeftImage(image: image!, offset: 52)
        return button
    }()
    private var logOutButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.addLeftTitle(titleText: "    Log out", offset: 80)
        button.setTitleColor(.black, for: .normal)
        var image = UIImage(named: "logOutImage")
        button.addLeftImage(image: image!, offset: 52)
        return button
    }()
    private var buttonsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0.0
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        return stackView
    }()
    weak var coordinator: AppCoordinator?
    var viewModel: ProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        configureStackView()
        configureConstraints()
    }
    
    private func configureStackView() {
        buttonsStackView.addArrangedSubview(traidStoreButton)
        buttonsStackView.addArrangedSubview(paymentButton)
        buttonsStackView.addArrangedSubview(balanceButton)
        buttonsStackView.addArrangedSubview(traidHistoryButton)
        buttonsStackView.addArrangedSubview(restoreButton)
        buttonsStackView.addArrangedSubview(helpButton)
        buttonsStackView.addArrangedSubview(logOutButton)
    }
    
    private func configureConstraints() {
        view.backgroundColor = .white
        view.addSubview(profileImage)
        view.addSubview(changePhotoLabel)
        view.addSubview(nameLabel)
        view.addSubview(uploadButton)
        view.addSubview(buttonsStackView)
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
            $0.height.equalTo(ProfileConstants.uploadHeight)
            $0.top.equalTo(nameLabel.snp.bottom).offset(ProfileConstants.uploadTop)
            $0.leading.trailing.equalToSuperview().inset(ProfileConstants.uploadOffset)
        }
        buttonsStackView.snp.makeConstraints {
            $0.top.equalTo(uploadButton.snp.bottom).offset(ProfileConstants.stackTop)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension UIButton {
    func addLeftImage(image: UIImage, offset: CGFloat) {
        self.setImage(image, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
        self.imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset).isActive = true
    }
    
    func addLeftTitle(titleText: String, offset: CGFloat) {
        self.setTitle(titleText, for: .normal)
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
        self.titleLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset).isActive = true
    }
}
