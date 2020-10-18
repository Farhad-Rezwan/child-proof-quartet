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
    var equipmentsClass: [Equipment] = EquipmentBank().list
    var allEquipmentNames: [String] = []

    mutating func fetchPark(urlLastPortion: String) -> [Park] {
        parkAPIURL = parkAPIURL + urlLastPortion
        return performFetchRequest(urlString: parkAPIURL)
    }
    
    mutating func  performFetchRequest(urlString: String) -> [Park] {
        allEquipmentNames = self.populateAllEquipmentNamesOnce()
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
                    var max = 0
                    // json is an array
                    for anItem in object as! [Dictionary<String, AnyObject>] {
                        if max < 5 {
                            let name = anItem["park_name"] as! String
                            let distance = anItem["distance"] as! String
                            let facilities = anItem["park_equipment"] as! [String]
                            let ranking = (anItem["park_score"] as! NSString).doubleValue
                            var choosenFacility: [String] = []
                            
                            for each in facilities {
                                if (getImageAvailable(equipmentName: each)) {
                                    
                                    choosenFacility.append(each)
                                } else {
                                    print("Not available \(each)")
                                }
                                
                            }
                            

                            
                            let park = Park(name: name, distance: distance, facility: choosenFacility, ranking: ranking)
                            parkObjects.append(park)
                            max = max + 1
                            
                        }

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
    
    func populateAllEquipmentNamesOnce() -> [String] {
        var names: [String] = []
        for item in equipmentsClass {
            names.append(item.name)
        }
        return names
    }
    
    func getImageAvailable(equipmentName: String) -> Bool {
        if allEquipmentNames.contains(equipmentName) {
            return true
        }
        return false
        
        
    }
}
