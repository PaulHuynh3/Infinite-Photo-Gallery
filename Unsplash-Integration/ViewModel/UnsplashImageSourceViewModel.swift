//
//  UnsplashImageSourceViewModel.swift
//  Unsplash-coding-challenge
//
//  Created by Paul on 2018-10-22.
//  Copyright © 2018 Paul. All rights reserved.
//

import Foundation
import UIKit

struct UnsplashImageSourceViewModel {
    
    let imageString: String
    let photographerName: String
    let photoId: String
    
    
    //Dependency Injection
    //Perform logic check in here
    init(unsplashImageSource: UnsplashImageSource) {
        self.imageString = unsplashImageSource.imageString
        self.photographerName = unsplashImageSource.photographerName
        self.photoId = unsplashImageSource.photoId
    }
    
    
}
