//
//  BusinessesVC.swift
//  WM
//
//  Created by Golovanov, Eugene on 2/27/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit

class BusinessesVC: UIViewController {
    
    var location = "Irvine"
    var searchLocation: String {
        return self.location.removingWhitespaces()
    }
    var term = ""
    var searchTerm: String {
        return self.term.removingWhitespaces()
    }

    var searchResults = ["pizza", "movie", "steak"]
//    var searchResults = [String]()
    
    var businesses = [Business]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Location: \(self.location)"
        
        self.searchBar.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let cl = UIBarButtonItem(title: "location", style: .plain, target: self, action: #selector(showLocationAlert))
        navigationItem.rightBarButtonItems = [cl]
    }
    
    @objc func showLocationAlert() {
        self.alertInput { (text) in
            print("✅WE got Text: \(text)")
            self.location = text
            self.title = "Location: \(self.location)"
        }
    }
    
    func getBusinesses(term: String, location: String) {
        self.showSpinner()
        APIManager.get(url: APIManager.getApiUrl(term: term, location: location), token: token) { [weak self] (code, object) in
            self?.hideSpinner()
            guard (code == 200) else {
                print("Request Error")
                return
            }
            guard let data = object as? [String:AnyObject] else {
                print("Data Error")
                return
            }
            guard let businesses = data["businesses"] as? [[String:AnyObject]] else {
                print("User Data Error")
                return
            }
            self?.businesses.removeAll()
            self?.businesses = businesses.map { return Business(data: $0) }
            self?.businesses.sort { $0.rating > $1.rating }//Sort by rating
            self?.collectionView.reloadData()
            print("======== Businesses count: \(String(describing: self?.businesses.count))")
            print("data")
        }

    }
}

