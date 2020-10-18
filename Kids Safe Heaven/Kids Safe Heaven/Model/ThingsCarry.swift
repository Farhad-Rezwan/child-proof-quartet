//
//  ThingsCarry.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 9/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation


class ThingsCarry: Equatable {
    static func == (lhs: ThingsCarry, rhs: ThingsCarry) -> Bool {
        return lhs.itemName == rhs.itemName
    }
    
    var itemName: String
    var itemImage: String
    var itemSafetyTips: String
    var itemValidity: Bool
    var itemType: String
    var itemSelected: Bool
 
    init(itemName: String, itemImage: String, itemSafetyTips: String, itemValidity: Bool, itemType: String) {
        self.itemName = itemName
        self.itemImage = itemImage
        self.itemSafetyTips = itemSafetyTips
        self.itemValidity = itemValidity
        self.itemType = itemType
        // Initially the item selected will always be false
        self.itemSelected = false
    }

}

class ThingsToCarryBank {
    var list = [ThingsCarry] ()
    init(type: String)  {
        if type == "normal" {
            // MARK: - Normal Weather
            list.append(ThingsCarry(itemName: "Band Aid", itemImage: "nor1", itemSafetyTips: "norS1", itemValidity: true, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Sunscreen", itemImage: "nor2", itemSafetyTips: "norS2", itemValidity: true, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Water Bottle", itemImage: "nor3", itemSafetyTips: "norS3", itemValidity: true, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Sneaker", itemImage: "nor4", itemSafetyTips: "norS4", itemValidity: true, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Chocolate", itemImage: "nor5", itemSafetyTips: "norS5", itemValidity: true, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Snack", itemImage: "nor6", itemSafetyTips: "norS6", itemValidity: false, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Flip Flops", itemImage: "nor7", itemSafetyTips: "norS7", itemValidity: false, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Gum", itemImage: "nor8", itemSafetyTips: "norS8", itemValidity: false, itemType: "normal"))
            list.append(ThingsCarry(itemName: "Lollipop", itemImage: "nor9", itemSafetyTips: "norS9", itemValidity: false, itemType: "normal"))
        } else if type == "winter" {
            // MARK: - Cold Weather
            list.append(ThingsCarry(itemName: "Winter Jacket", itemImage: "win1", itemSafetyTips: "winS1", itemValidity: true, itemType: "winter"))
            list.append(ThingsCarry(itemName: "Scarf", itemImage: "win2", itemSafetyTips: "winS2", itemValidity: true, itemType: "winter"))
            list.append(ThingsCarry(itemName: "Glove", itemImage: "win3", itemSafetyTips: "winS3", itemValidity: true, itemType: "winter"))
            list.append(ThingsCarry(itemName: "Warm water", itemImage: "win4", itemSafetyTips: "winS4", itemValidity: true, itemType: "winter"))
            list.append(ThingsCarry(itemName: "Moisturising Cream", itemImage: "win5", itemSafetyTips: "winS5", itemValidity: true, itemType: "winter"))
            list.append(ThingsCarry(itemName: "T-shirt", itemImage: "win6", itemSafetyTips: "winS6", itemValidity: false, itemType: "winter"))
            list.append(ThingsCarry(itemName: "Handhold Fan", itemImage: "win7", itemSafetyTips: "winS7", itemValidity: false, itemType: "winter"))
            list.append(ThingsCarry(itemName: "Ice-cream", itemImage: "win8", itemSafetyTips: "winS8", itemValidity: false, itemType: "winter"))
            list.append(ThingsCarry(itemName: "Shorts", itemImage: "win9", itemSafetyTips: "winS9", itemValidity: false, itemType: "winter"))
            
        } else if type == "summer" {
            // MARK: - Hot Weather
            list.append(ThingsCarry(itemName: "Sunscream", itemImage: "sum1", itemSafetyTips: "sumS1", itemValidity: true, itemType: "summer"))
            list.append(ThingsCarry(itemName: "Sunhat", itemImage: "sum2", itemSafetyTips: "sumS2", itemValidity: true, itemType: "summer"))
            list.append(ThingsCarry(itemName: "Water", itemImage: "sum3", itemSafetyTips: "sumS3", itemValidity: true, itemType: "summer"))
            list.append(ThingsCarry(itemName: "T-shirt", itemImage: "sum4", itemSafetyTips: "sumS4", itemValidity: true, itemType: "summer"))
            list.append(ThingsCarry(itemName: "Mosquito Spray", itemImage: "sum5", itemSafetyTips: "sumS5", itemValidity: true, itemType: "summer"))
            list.append(ThingsCarry(itemName: "Coat", itemImage: "sum6", itemSafetyTips: "sumS6", itemValidity: false, itemType: "summer"))
            list.append(ThingsCarry(itemName: "Warm Water", itemImage: "sum7", itemSafetyTips: "sumS7", itemValidity: false, itemType: "summer"))
            list.append(ThingsCarry(itemName: "Scarf", itemImage: "sum8", itemSafetyTips: "sumS8", itemValidity: false, itemType: "summer"))
            list.append(ThingsCarry(itemName: "Flip Flops", itemImage: "sum9", itemSafetyTips: "sumS9", itemValidity: false, itemType: "summer"))
            
        }
   }
}
