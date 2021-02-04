//
//  DetailsVC.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageViewAvatar: ImageViewSpinner!
    @IBOutlet weak var labelFirstName: UILabel!
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        guard let u = self.user else {
            print("User Error")
            return
        }
        self.imageViewAvatar.url = u.largeUrl
        self.labelFirstName.text = u.firstName
        self.labelLastName.text = u.lastName
        self.labelUsername.text = u.username
        self.labelEmail.text = u.email
        self.labelGender.text = u.gender
        self.labelPhone.text = u.phone
    }
}
