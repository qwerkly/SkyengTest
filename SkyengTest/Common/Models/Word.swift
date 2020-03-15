//
//  Word.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 13.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import Foundation

struct Word: Decodable {
    let id: Int
    let text: String
    let meanings: [Meaning]
}
