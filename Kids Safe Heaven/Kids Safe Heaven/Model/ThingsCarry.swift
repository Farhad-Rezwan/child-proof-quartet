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
    var itemSelected: Bool
 
    init(itemName: String, itemImage: String, itemSafetyTips: String, itemValidity: Bool) {
        self.itemName = itemName
        self.itemImage = itemImage
        self.itemSafetyTips = itemSafetyTips
        self.itemValidity = itemValidity
        
        // Initially the item selected will always be false
        self.itemSelected = false
    }

}

class ThingsToCarryBank {
    var list = [ThingsCarry] ()
    init()  {
        // MARK: - Normal Weather
        list.append(ThingsCarry(itemName: "Bandage", itemImage: "nor1", itemSafetyTips: "Band aid will help you deal with the wound in time after you get hurt", itemValidity: true))
        list.append(ThingsCarry(itemName: "Sunscreen", itemImage: "nor2", itemSafetyTips: "Sunscreen will protect your skin health", itemValidity: true))
        list.append(ThingsCarry(itemName: "Water Bottle", itemImage: "nor3", itemSafetyTips: "Drinking water will help you stay hydrated after playing", itemValidity: true))
        list.append(ThingsCarry(itemName: "Shoe", itemImage: "nor4", itemSafetyTips: "Wearing sneakers will reduce the risk of injury and also be more flexible while playing", itemValidity: true))
        list.append(ThingsCarry(itemName: "Chocolate", itemImage: "nor5", itemSafetyTips: "It will give you energy while playing", itemValidity: true))
        
        // MARK: - Cold Weather
        list.append(ThingsCarry(itemName: "Winter jacket", itemImage: "win1", itemSafetyTips: "Wearing winter jacket keeps you warm and safe", itemValidity: false))
        list.append(ThingsCarry(itemName: "Winter scarf", itemImage: "win2", itemSafetyTips: "Wearing scarf keeps you warmer and allows you to play outside longer", itemValidity: false))
        list.append(ThingsCarry(itemName: "Winter gloves", itemImage: "win3", itemSafetyTips: "A pair of winter gloves can slow down the flow of heat and make you feel warm on a cold day", itemValidity: false))
        list.append(ThingsCarry(itemName: "Warm water bottle", itemImage: "win4", itemSafetyTips: "Nothing like warm drinks to warm your insides", itemValidity: false))
        list.append(ThingsCarry(itemName: "Winter cream", itemImage: "win5", itemSafetyTips: "Moisturising Cream can protect your skin from cracking in winter", itemValidity: false))
   }
}
