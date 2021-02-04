//
//  APIManager.swift
//  EnvoyCodeTest
//
//  Created by Golovanov, Eugene on 2/7/18.
//  Copyright © 2018 Envoy. All rights reserved.
//

import UIKit

class APIManager {
    
    enum Method:String {
        case get = "GET"
        case post = "POST"
    }
    
    typealias Response = (_ code: Int, _ object: Any?) -> Void
    
    class func get(url: ApiUrl, clientID: String, response: @escaping Response) {
        self.request(method: .get, url: url, clientID: clientID) { (object, code, error) in
            response(code, object)
        }
    }
    
    private class func request(method: Method, url: ApiUrl, payload: Any? = nil, clientID: String, completionHandler: @escaping (Any?, Int, Error?) -> Swift.Void) {
        guard let url = URL(string: url.rawValue) else {
            completionHandler(nil, -1, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(clientID, forHTTPHeaderField: "Client-ID") // Using our Client-ID in header
        
        if let dictPayload = payload as? [String: Any] {
            request.httpBody = dictPayload.JSONData
        } else if let arrayPayload = payload as? [Any] {
            request.httpBody = arrayPayload.JSONData
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            var responseObject: Any? = nil
            
            if let responseData = data {
                if let obj = responseData.JSONObject {
                    responseObject = obj
                } else if let image = UIImage(data: responseData) {
                    responseObject = image
                }
            }
            GCD.mainThread {
                completionHandler(responseObject, (response as? HTTPURLResponse)?.statusCode ?? -1, error)
            }
        }
        
        task.resume()
    }
}

