//
//  spotTheDanger.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 18/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation

class SpotTheDanger: Equatable {
    static func == (lhs: SpotTheDanger, rhs: SpotTheDanger) -> Bool {
        return lhs.dangerName == rhs.dangerName
    }
    

    var dangerName: String
    var dangerTips: String
    var dangerImage: String
    
    init(dangerName: String, dangerImage: String, dangerTips: String) {
        self.dangerName = dangerName
        self.dangerTips = dangerTips
        self.dangerImage = dangerImage
    }
}

class SpotTheDangerBank {
    var list = [SpotTheDanger] ()
    init() {
        list.append(SpotTheDanger(dangerName: "Crack on the slide", dangerImage: "danImg2", dangerTips: "danTip2"))
        list.append(SpotTheDanger(dangerName: "Broken Glass Bottle", dangerImage: "danImg1", dangerTips: "danTip1"))
        list.append(SpotTheDanger(dangerName: "Small Sharp rocks", dangerImage: "danImg3", dangerTips: "danTip3"))
        list.append(SpotTheDanger(dangerName: "Water Sprinklers", dangerImage: "danImg7", dangerTips: "danTip7"))
        list.append(SpotTheDanger(dangerName: "Water Puddle", dangerImage: "danImg5", dangerTips: "danTip5"))
        list.append(SpotTheDanger(dangerName: "A hole in the play equipment", dangerImage: "danImg6", dangerTips: "danTip6"))
        list.append(SpotTheDanger(dangerName: "Broken Swing", dangerImage: "danImg4", dangerTips: "danTip4"))
    }
}
