//
//  BusinessCell.swift
//  WM
//
//  Created by Golovanov, Eugene on 2/27/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit

class BusinessCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: ImageViewSpinner!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    func configureCell(business:Business) {
        self.labelTitle.text = business.name
        self.labelRating.text = "rating: \(business.rating)"
        self.imageView.url = business.imageUrl
    }
    
}

