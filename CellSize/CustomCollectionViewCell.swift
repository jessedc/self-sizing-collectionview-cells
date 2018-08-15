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
                configure(withTitle: title)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        installConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installConstraints()
    }

    func installConstraints() {
        contentView.addSubview(self.titleLabel)

        titleLabel.widthAnchor.constraint(equalToConstant: 220.0).isActive = true
        
        // if you want a minimum cell height
        //titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 220.0).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
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
        titleLabel.text = title

        setNeedsLayout()
    }
}
