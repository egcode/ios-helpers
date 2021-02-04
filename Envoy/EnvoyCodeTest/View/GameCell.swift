//
//  GameCell.swift
//  EnvoyCodeTest
//
//  Created by Golovanov, Eugene on 2/7/18.
//  Copyright © 2018 Envoy. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: ImageViewSpinner!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelViewers: UILabel!
    
    func configureCell(game:Game) {
        self.labelTitle.text = game.name
        self.labelViewers.text = "\(game.viewers) watching"
        self.imageView.url = game.imageLargeUrl
    }

}
