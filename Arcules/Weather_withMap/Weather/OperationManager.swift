//
//  OperationManager.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import Foundation

class OperationsManager {
    
    static let sharedOM = OperationsManager()
    
    lazy var weatherQueue:OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Weather queue"
        queue.maxConcurrentOperationCount = 3
        return queue
    }()
    
}
