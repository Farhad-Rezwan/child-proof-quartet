//
//  ParkManager.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 14/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation

struct ParkManager {
    var parkAPIURL =  "http://ec2-13-236-86-189.ap-southeast-2.compute.amazonaws.com/api/park?format=json&"

    mutating func fetchPark(urlLastPortion: String) -> [Park] {
        parkAPIURL = parkAPIURL + urlLastPortion
        return performFetchRequest(urlString: parkAPIURL)
    }
    
    func  performFetchRequest(urlString: String) -> [Park] {
        var parkObjects: [Park] = []
        
        // 1. create URL
        do {
            if let file = URL(string: urlString) {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    for anItem in object as! [Dictionary<String, AnyObject>] {
                        let name = anItem["park_name"] as! String
                        let distance = anItem["distance"] as! String
                        var park = Park(name: name, distance: distance)
                        print("----equipments-----")
                        print(distance)
                        print("-------X--------")
                        parkObjects.append(park)
                        print(name)
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return parkObjects
    }
}
