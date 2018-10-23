//
//  UnsplashPhotoCollectionViewCell.swift
//  Unsplash-coding-challenge
//
//  Created by Paul on 2018-08-23.
//  Copyright © 2018 Paul. All rights reserved.
//

import UIKit

class UnsplashPhotoCollectionViewCell: UICollectionViewCell {
    
    var unsplashimageSourceViewModel: UnsplashImageSourceViewModel! {
        didSet {
            unsplashImage.loadImageUsingCacheWithUrlString(urlString: unsplashimageSourceViewModel.imageString)
        }
    }
    
    @IBOutlet weak var unsplashImage: UIImageView!
    
}
