//
//  Meaning.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 14.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import Foundation

struct Meaning: Decodable {
    let id: Int
    let translation: Translation
    let imageUrl: String?
    
    var imageConvertedUrl: URL? {
        guard let imageUrl = imageUrl else { return nil }
        
        return URL(string: "https:\(imageUrl)")
    }
}

struct Translation: Decodable {
    let text: String
}
