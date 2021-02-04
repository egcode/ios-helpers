//
//  ViewController+CollectionView.swift
//  EnvoyCodeTest
//
//  Created by Golovanov, Eugene on 2/7/18.
//  Copyright © 2018 Envoy. All rights reserved.
//

import UIKit

extension GamesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GameCell else {
            print("Cell Error at indexPath: \(indexPath)")
            return UICollectionViewCell()
        }
        cell.configureCell(game: self.games[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped on: \(self.games[indexPath.row].name)")
    }
}


extension GamesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 3
        var navigationHeight: CGFloat = 0
        if let nbh = self.navigationController?.navigationBar.frame.height { navigationHeight = CGFloat(nbh) }
        var widthRemainingForCellContent = collectionView.bounds.width
        var heightRemainingForCellContent = collectionView.bounds.height - navigationHeight - 20
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
            widthRemainingForCellContent -= borderSize + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
            
            let borderSizeHeight: CGFloat = flowLayout.sectionInset.bottom + flowLayout.sectionInset.top
            heightRemainingForCellContent -= borderSizeHeight + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
        }
        let cellWidth = widthRemainingForCellContent / cellsAcross
        let cellHeight = heightRemainingForCellContent / cellsAcross
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
