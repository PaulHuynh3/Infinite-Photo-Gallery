//
//  DetailedPhotoViewController.swift
//  Unsplash-coding-challenge
//
//  Created by Paul on 2018-08-24.
//  Copyright © 2018 Paul. All rights reserved.
//

import UIKit

class DetailedPhotoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var unsplashArray: [UnsplashImageSourceViewModel]!
    var initialImageIndex: Int?
    var lastPhotoPositionDelegate: LastPhotoPositionDelegate?
    var currentImageIndex: Int?
    
    fileprivate let unsplashCellIdentifier = "UnsplashDetailedCollectionviewCell"
    
    override func viewDidDisappear(_ animated: Bool) {
        if let currentImageIndex = currentImageIndex {
            lastPhotoPositionDelegate?.scrollToCurrentIndex(currentImageIndex)
        }
    }
    
    override func viewDidLayoutSubviews() {
        registerUnsplashCollectionViewCell(cellIdentifier: unsplashCellIdentifier)
        if let initialImageIndex = initialImageIndex {
            guard let collectionView = collectionView else {return}
            collectionView.scrollToItem(at: IndexPath(item: initialImageIndex, section: 0), at: .centeredHorizontally, animated: false)
            self.initialImageIndex = nil
        }
    }
    
    fileprivate func registerUnsplashCollectionViewCell(cellIdentifier: String) {
        let cell = UINib(nibName: cellIdentifier, bundle: nil)
        if let collectionView = collectionView {
            collectionView.register(cell, forCellWithReuseIdentifier: cellIdentifier)
        }
    }
}

extension DetailedPhotoViewController: UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unsplashArray.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: unsplashCellIdentifier, for: indexPath) as! UnsplashDetailedCollectionviewCell
        let unsplashItem = unsplashArray[indexPath.row]
        currentImageIndex = indexPath.row
        cell.unsplashImageSourceViewModel = unsplashItem
        return cell
    }
}

extension DetailedPhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeForItem = CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
        return sizeForItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
