//
//  LoadingCell.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 15.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        if #available(iOS 13.0, *) {
            activityIndicator.style = .medium
        }
    }
}
