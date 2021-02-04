//
//  UIViewController+Alert.swift
//  WM
//
//  Created by Golovanov, Eugene on 2/27/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(_ message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertInput(completion: @escaping (_ text: String)->()) {
        let alertController = UIAlertController(title: "Change search location?", message: "Please input your location:", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields?[0], let text = field.text, text != "" {
                completion(text)
            } else {
                // user did not fill field
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "new location"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

