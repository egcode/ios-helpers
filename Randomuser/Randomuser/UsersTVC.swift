//
//  UsersTVC.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import UIKit

enum Segue: String {
    case details = "detailSegue"
    case settings = "settingsSegue"
}

class UsersTVC: UITableViewController {
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshData()
    }
    
    //-----------------------------------------------------------------------
    // MARK: - Refresh

    func refreshData() {
        
        API.get(url: Constants.apiRoot()) { [weak self] (code, object) in
            guard (code == 200) else {
                self?.refreshControl?.endRefreshing()
                self?.title = "Random users"
                return
            }
            guard let data = object as? [String:AnyObject] else {
                print("Data Error")
                return
            }
            guard let usersData = data["results"] as? [[String:AnyObject]] else {
                print("User Data Error")
                return
            }
            self?.users = usersData.map { return User(data: $0) }
            self?.users.sort { $0.firstName < $1.firstName }//Sort Alphabet
            self?.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
            self?.refreshControl?.endRefreshing()
            self?.title = "\(Constants.getCount()) Random users"
        }
    }
    
    //-----------------------------------------------------------------------
    // MARK: - Actions
    @IBAction func onSettingsButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: Segue.settings.rawValue, sender: nil)
    }

    @IBAction func refreshAction(_ sender: UIRefreshControl) {
        self.refreshData()
    }

    
    //-----------------------------------------------------------------------
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    //-----------------------------------------------------------------------
    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cl", for: indexPath) as? UserCell else {
            print("Cell Error")
            return UITableViewCell()
        }
        cell.configureCell(user: self.users[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = self.users[indexPath.row]
        self.performSegue(withIdentifier: Segue.details.rawValue, sender: selectedUser)
    }
    
    
    //-----------------------------------------------------------------------
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.details.rawValue {
            guard let selectedUser = sender as? User else {
                print("Error In Selected User")
                return
            }
            if let vc = segue.destination as? DetailsVC {
                vc.user = selectedUser
            }
        }
    }
}
