//
//  UnsplashDetailedCollectionviewCell.swift
//  Unsplash-coding-challenge
//
//  Created by Paul on 2018-10-22.
//  Copyright © 2018 Paul. All rights reserved.
//

import Foundation
import UIKit

class UnsplashDetailedCollectionviewCell: UICollectionViewCell {
    
    @IBOutlet weak var unsplashImage: UIImageView!
    @IBOutlet weak var photographerName: UILabel!
    
    var unsplashImageSourceViewModel: UnsplashImageSourceViewModel! {
        didSet{
            unsplashImage.loadImageUsingCacheWithUrlString(urlString: unsplashImageSourceViewModel.imageString)
            photographerName.text = unsplashImageSourceViewModel.photographerName
        }
    }
}
