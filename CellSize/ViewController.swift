//
//  ViewController.swift
//  CellSize
//
//  Created by Jesse Collis on 15/8/18.
//  Copyright © 2018 JCMultimedia. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let cellTitles = [
        "Getting started with Apple ML",
        "Demystifying self-sizing cells",
        "Really long cell title, longer than anyone could reasonably anticipate, hopefully it also displays correctly",
        "Another cell",
        "Yet another, we need two rows"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")

        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 220, height: 220)
            flowLayout.sectionInset = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
            flowLayout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellTitles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Unexpected cell class")
        }

        cell.title = cellTitles[indexPath.row]

        return cell
    }
}

