//
//  UINavigationBar+BottomBorder.swift
//  EnvoyCodeTest
//
//  Created by Golovanov, Eugene on 2/7/18.
//  Copyright © 2018 Envoy. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    @IBInspectable var bottomBorderColor: UIColor {
        get {
            return self.bottomBorderColor;
        }
        set {
            let bottomBorderRect = CGRect.zero;
            let bottomBorderView = UIView(frame: bottomBorderRect);
            bottomBorderView.backgroundColor = newValue;
            addSubview(bottomBorderView);
            
            bottomBorderView.translatesAutoresizingMaskIntoConstraints = false;
            
            self.addConstraint(NSLayoutConstraint(item: bottomBorderView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0));
            self.addConstraint(NSLayoutConstraint(item: bottomBorderView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0));
            self.addConstraint(NSLayoutConstraint(item: bottomBorderView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0));
            self.addConstraint(NSLayoutConstraint(item: bottomBorderView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 4));
        }
        
    }
    
}
