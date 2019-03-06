//
//  DataManager.swift
//  SimpleJSON_ICB
//
//  Created by Ian Campbell Brothers on 3/4/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    let MYJSONURL = "https://api.myjson.com/bins/xf9hi"
    var dataArray = ["Unexpected Data. Check URL."]
    
    func getData(completion: @escaping (_ success:Bool) -> ()) {
        var success = true
        let actualURL = URL(string: MYJSONURL)
        
        let task = URLSession.shared.dataTask(with: actualURL!) { (data, respose, error) in
            
            if let _ = data, error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    
                    if let veggieArray = jsonObj!.value(forKey: "tragicdeathsindarksouls1") as? Array<String> {
                        self.dataArray = veggieArray
                    
                        print(jsonObj!.value(forKey: "tragicdeathsindarksouls1")!)
                    }
                }
            } else {
                success = false
            }
         completion(success)
        }
        task.resume()
    }
}

