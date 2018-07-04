//
//  DOTImage.swift
//  DOTextension
//
//  Created by Agus Cahyono on 25/06/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation
import SDWebImage


open class NinjaImage {
    
    public static let shared = NinjaImage()
    
    
    /// Set Image
    ///
    /// - Parameters:
    ///   - imageView: uiimageview
    ///   - url: url of image
    ///   - placeholder: placeholder image
    func setImage(_ imageView: UIImageView, url: URL, placeholder: UIImage) {
        imageView.sd_setImage(with: url, placeholderImage: placeholder, options: SDWebImageOptions.allowInvalidSSLCertificates, progress: { (progressInt, completeInt, url) in
            
        }) { (img, error, cacheType, url) in
            
        }
    }
    
    
    /// CACHED IMAGE DISPLAY
    ///
    /// - Parameter initCacheName: key for cache image
    /// - Returns: image already in cache
    func cachedImage(initCacheName: String) -> UIImage {
        var imageCaching = UIImage()
        let imageCache: SDImageCache = SDImageCache.init(namespace: initCacheName)
        imageCache.queryCacheOperation(forKey: initCacheName) { (image, data, cacheType) in
            if let imageCached = image {
                imageCaching = imageCached
            }
        }
        
        return imageCaching
    }
    
    
    /// STORE IMAGE TO CACHE
    ///
    /// - Parameters:
    ///   - image: image to cache
    ///   - key: key for cache image
    func storeImageCache(_ image: UIImage, key: String) {
        SDImageCache.shared().store(image, forKey: key) {
            print("Image cached")
        }
    }
    
}
