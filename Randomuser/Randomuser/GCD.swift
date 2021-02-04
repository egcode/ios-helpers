//
//  GCD.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import Foundation

public class GCD {
    
    public class func mainThread(block:@escaping () -> Void) {
        DispatchQueue.main.async {block()}
    }
    
    public class func mainThreadDelayed(delay: TimeInterval, block:@escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {block()}
    }
    
    public class func backgroundThread(block:@escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {block()}
    }
    
    public class func backgroundThreadDelayed(delay: TimeInterval, block:@escaping () -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + delay) {block()}
        
    }
    
}
