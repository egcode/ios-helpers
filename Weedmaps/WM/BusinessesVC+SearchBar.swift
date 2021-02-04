//
//  BusinessesVC+SearchBar.swift
//  WM
//
//  Created by Golovanov, Eugene on 2/27/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit

protocol SearchResultsDelegate {
    func pastResultSelected(result: String)
}

extension BusinessesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print("Search Bar text: \(searchText)")
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier :"PastResults") as? SearchResultsTVC {
            vc.searchResults = self.searchResults
            vc.searchDelegate = self
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.deactivateSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text != "" || text != " " {
            self.searchAction(searchText: text)
        } else {
            self.alert("Please enter something", title: "Warning")
        }
    }
    
    func deactivateSearchBar() {
        searchBar.text = ""
        self.view.endEditing(true)
    }
    
    
    fileprivate func searchAction(searchText: String) {
        self.deactivateSearchBar()
        self.term = searchText
        if !self.searchResults.contains(searchText.lowercased()) {
            self.searchResults.append(searchText.lowercased())
        }
        self.getBusinesses(term: self.searchTerm, location: self.searchLocation)
    }
}

extension BusinessesVC: SearchResultsDelegate {
    func pastResultSelected(result: String) {
        self.searchAction(searchText: result)
    }
}
