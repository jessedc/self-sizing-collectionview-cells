//
//  ViewController.swift
//  CellSize
//
//  Created by Jesse Collis on 15/8/18.
//  Copyright © 2018 JCMultimedia. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    //Lis taken from https://www.youtube.com/playlist?list=PLRdg1MF7wOwySNZgwwKPS0vV6TxxbUbK-
    let cellTitles = [
        "An automated CoreML workflow for NLP",
        "The land before time - (An AppKit journey)",
        "Why Slack can be harmful",
        "Speaking Bluetooth LE with CoreBluetooth",
        "Animation workshop: Favourite Button",
        "Introduction to Swift on the server.",
        "All of our presentaions from this year are published in the \"2018 Presentations\" playlist over on YouTube. This cell should expand beyond the others.",
        "Scaling iOS engineering at Xero",
        "Strategies for dealing with Legacy Code",
        "What's new in ARKit 1.5",
        "An introduciton to Swift on the command line and the Swift package manager",
        "Mac OS Mojave Dark Mode",
        "Mac OS Mojave Marzipan's Internals",
        "Architecture for scaling mobile",
        "Structure and interpretation of Code Coverage",
        "View Styling with Salon",
        "Getting started with Apple ML",
        "Demystifying self-sizing cells",
        "USDZ Format",
        "#TIL September 2018",
        "Mac OS Keybaord shortcuts"
    ]

    let cellIdentifier = "CustomCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: self.cellIdentifier)

        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 25, height: 30)
            flowLayout.sectionInset = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
            flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellTitles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Unexpected cell class")
        }

        cell.title = self.cellTitles[indexPath.row]

        return cell
    }
}

