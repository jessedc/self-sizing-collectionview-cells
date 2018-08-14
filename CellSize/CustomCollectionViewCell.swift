//
//  CustomCollectionViewCell.swift
//  CellSize
//
//  Created by Jesse Collis on 15/8/18.
//  Copyright © 2018 JCMultimedia. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    var title: String? {
        didSet {
            if let title = title {
                self.configure(withTitle: title)
            }
        }
    }

    var hasUpdatedConstraints = false

    override func updateConstraints() {
        super.updateConstraints()

        if !self.hasUpdatedConstraints {
            self.contentView.addSubview(self.titleLabel)

            self.hasUpdatedConstraints = true

            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false

            self.titleLabel.widthAnchor.constraint(equalToConstant: 220).isActive = true
            self.titleLabel.heightAnchor.constraint(equalToConstant: 220).isActive = false

            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0

        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.0

        return label
    }()

    private func configure(withTitle title: String) {
        self.titleLabel.text = title

        self.setNeedsUpdateConstraints()
    }
}
