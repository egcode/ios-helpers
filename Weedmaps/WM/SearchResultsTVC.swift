//
//  SearchResultsTVC.swift
//  WM
//
//  Created by Golovanov, Eugene on 2/27/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit


class SearchResultsTVC : UITableViewController {
    
    var searchResults = [String]()
    var searchDelegate: SearchResultsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Past Search Results"
        
        self.searchResults = Array(Set(self.searchResults))
        
        let cl = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(SearchResultsTVC.onCancelButton))
        navigationItem.rightBarButtonItems = [cl]
    }
    
    @objc func onCancelButton() {
        self.dismiss(animated: true) {
        }
    }
    //------------------------------------------------------------------------------
    // MARK: - -Table view-
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        cell.textLabel?.text = self.searchResults[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchDelegate?.pastResultSelected(result: self.searchResults[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }

}
