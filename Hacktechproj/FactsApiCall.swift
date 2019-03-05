//
//  FactsApiCall.swift
//  Hacktechproj
//
//  Created by Mohit on 03/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import Foundation
class FactsApiCall
{
    var jsonResult:NSDictionary?
    init()
    {
        loadfactdata() // the JSON will be readied here
    }
    
    func loadfactdata()// -> String
    {
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        var dataTask: URLSessionDataTask?
        let projectID = 12
        var url : String = "http://randomuselessfact.appspot.com/random.json"
        var apiURL = URL(string: url)
        print("line 25", apiURL!) // Debugging
        dataTask = defaultSession.dataTask(with: apiURL!) {
            data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let responseData = data {
                        if let json = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? NSDictionary {
                            print(json!)
                            self.jsonResult = json
                        }
                    }
                }
            }
        }
        
        dataTask?.resume()
        
    } // end of loadfactdata()
    
    func getJSON() -> NSDictionary
    {
        return jsonResult!
    }
    
}
