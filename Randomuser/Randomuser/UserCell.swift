//
//  UserCell.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var spinnerImageView: ImageViewSpinner!
    @IBOutlet weak var labelUserTitle: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(user:User) {
        self.spinnerImageView.url = user.mediumUrl
        self.labelUserTitle.text = user.fullName
        self.labelTitle.text = user.title
        self.labelEmail.text = user.email
    }
    
}
