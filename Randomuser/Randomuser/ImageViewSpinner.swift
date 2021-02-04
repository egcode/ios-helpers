//
//  ImageViewSpinner.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import UIKit

fileprivate var IMAGE_CACHE = NSCache<NSString, UIImage>()

class ImageViewSpinner:UIImageView {
    
    private var loadingIndicator = UIActivityIndicatorView()
    
    var url:String = "" {
        didSet {
            self.loadImage()
        }
    }
    
    override func awakeFromNib() {
        //Look
        self.layer.cornerRadius = max(self.frame.width/2, self.frame.height/2)
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        
        //Spinner
        let spinWidth:CGFloat = 20
        loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: self.frame.width/2 - spinWidth/2, y: self.frame.height/2 - spinWidth/2, width: spinWidth, height: spinWidth)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        self.loadingIndicator.stopAnimating()
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.addSubview(loadingIndicator)
    }
    
    private func loadImage() {
        guard self.url.isURL() else {
            print("Please provide valid url")
            return
        }
        //Image from cache
        if let img = IMAGE_CACHE.object(forKey: self.url as NSString) {
//            print("Loading image From Cache")
            self.image = img
        } else {
            guard let u =  URL(string: self.url) else { print("error in url");return }
            //Image from web
//            print("Loading image From WEB")
            loadingIndicator.startAnimating()
            GCD.backgroundThread {
                let data = try? Data(contentsOf: u)
                var image : UIImage?
                if let d = data, let im = UIImage(data: d) {
                    image = im
                    IMAGE_CACHE.setObject(im, forKey: self.url as NSString)
                }
                GCD.mainThread {
                    self.loadingIndicator.stopAnimating()
                    self.image = image
                }
            }
        }
    }
}
