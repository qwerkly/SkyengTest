//
//  UIImageView_ext.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 14.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setAsync(_ imageUrl: URL?, cacheKey: String, completion: (() -> Void)? = nil) {
        guard let imageUrl = imageUrl else {
            image = nil
            return
        }
        
        kf.setImage(with: ImageResource(downloadURL: imageUrl, cacheKey: cacheKey)) { _ in
            completion?()
        }
    }
}
