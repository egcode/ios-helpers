//
//  MaterialView.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import UIKit

class MaterialView: UIView {
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 30.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
}
