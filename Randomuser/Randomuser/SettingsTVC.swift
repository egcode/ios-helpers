//
//  SettingsTVC.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import UIKit

class SettingsTVC: UITableViewController {
    
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var sliderCnt: UISlider!
    
    //----------------------------------------------------------
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.alwaysBounceVertical = false //Remove scrolling
        self.title = "Settings"
        sliderCnt.value = Float(Constants.getCount())
        labelCount.text = "\(Constants.getCount())"
    }
    
    //----------------------------------------------------------
    // MARK: - Action
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let defaults = UserDefaults.standard
        defaults.set(Int(sliderCnt.value), forKey: Constants.countKey)
        labelCount.text = "\(Int(sliderCnt.value))"
    }
    
}
