//
//  MainTableViewCell.swift
//  Machine_Test
//
//  Created by Amitabh Pandey on 21/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(profileImageView)
        addSubview(containerView)
        containerView.backgroundColor = .red
        //containerView.addSubview(nameLabel)
        setupConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstriant() {
        
        profileImageView.anchor(nil, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 80)
        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        containerView.anchor(self.topAnchor, left: self.profileImageView.rightAnchor, bottom: nil, right: self.safeAreaLayoutGuide.rightAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 2, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        containerView.addSubview(nameLabel)
        nameLabel.anchor(self.containerView.topAnchor, left: self.containerView.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 18)
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.anchor(self.nameLabel.bottomAnchor, left: self.containerView.leftAnchor, bottom: self.containerView.bottomAnchor, right: self.containerView.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }

}
