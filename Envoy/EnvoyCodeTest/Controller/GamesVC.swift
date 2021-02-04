//
//  ViewController.swift
//  EnvoyCodeTest
//
//  Created by Envoy on 10/15/17.
//  Copyright © 2017 Envoy. All rights reserved.
//

import UIKit

class GamesVC: UIViewController {

    var games = [Game]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Envoy Code Test: Twitch Top Games"
        self.navigationController?.navigationBar.bottomBorderColor = Color.navigationBarBorder

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        APIManager.get(url: .topTwenty, clientID: ClientID) { [weak self] (code, object) in
            guard (code == 200) else {
                print("Request Error code \(code):  \(String(describing: object))")
                return
            }
            guard let data = object as? [String:AnyObject] else {
                print("Data Error")
                return
            }
            guard let tomGames = data["top"] as? [[String:AnyObject]] else {
                print("User Data Error")
                return
            }
            self?.games = tomGames.map { return Game(data: $0) }
            self?.games.sort { $0.viewers > $1.viewers }//Sort by viewers
            self?.collectionView.reloadData()
            print("======== Games count: \(String(describing: self?.games.count))")
        }
    }
    
}

