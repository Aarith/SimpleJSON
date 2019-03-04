//
//  DataManager.swift
//  SimpleJSON_ICB
//
//  Created by Ian Campbell Brothers on 3/4/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    func getData() {
        let urlString = "https://api.myjson.com/bins/136w0u"
        
        let actualURL = URL(string: urlString)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: actualURL!) { (data, response, error) in
            if error != nil {
                // handle the error
                
            }
            if let successfulData = data {
                print(String(data: successfulData, encoding: String.Encoding.ascii))
            }
        }
        task.resume()
    }
}
