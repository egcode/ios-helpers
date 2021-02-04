//
//  WeatherVC+CollectionView.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit

extension WeatherVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weatherDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WeatherCell else {
            print("Cell Error at indexPath: \(indexPath)")
            return UICollectionViewCell()
        }
        cell.configureCell(weatherDay: self.weatherDays[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped on: \(String(describing: self.weatherDays[indexPath.row].dateString))")
    }
}

//extension WeatherVC: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellsAcrossWidth: CGFloat = 1
//        let cellsAcrossHeight: CGFloat = 1
//
//        var navigationHeight: CGFloat = 0
//        if let nbh = self.navigationController?.navigationBar.frame.height { navigationHeight = CGFloat(nbh) }
//        var widthRemainingForCellContent = collectionView.bounds.width
//        var heightRemainingForCellContent = collectionView.bounds.height - navigationHeight
//
//        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
//            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
//            widthRemainingForCellContent -= borderSize + ((cellsAcrossWidth - 1) * flowLayout.minimumInteritemSpacing)
//
//            let borderSizeHeight: CGFloat = flowLayout.sectionInset.bottom + flowLayout.sectionInset.top
//            heightRemainingForCellContent -= borderSizeHeight + ((cellsAcrossHeight - 1) * flowLayout.minimumInteritemSpacing)
//        }
//        let cellWidth = widthRemainingForCellContent / cellsAcrossWidth
//        let cellHeight = heightRemainingForCellContent / cellsAcrossHeight
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//}

