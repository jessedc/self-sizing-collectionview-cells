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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        installConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configureConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.configureConstraints()
    }

    /// The cell's size is defined by the label within it, which is sized to be at least 220pt x 220pt.
    /// It will grow with the label's content
    func configureConstraints() {
        self.contentView.addSubview(self.titleLabel)

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let height = self.titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 220)
        height.priority = .required - 1

        let width = self.titleLabel.widthAnchor.constraint(equalToConstant: 220)
        width.priority = .required - 1

        NSLayoutConstraint.activate([
            height,
            width,
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }

    /// This is a good place to put breakpoints
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)

        return size
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

        self.setNeedsLayout()
    }
}
