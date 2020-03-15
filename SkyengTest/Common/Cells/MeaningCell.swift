//
//  MeaningCell.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 15.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import UIKit

class MeaningCell: UITableViewCell {
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var meaningImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
