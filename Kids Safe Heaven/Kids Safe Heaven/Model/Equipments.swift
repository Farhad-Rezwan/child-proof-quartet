//
//  Equipments.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 16/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation

class Equipment{
    var name: String
    var group: String
    
    init(name: String, group: String) {
        self.name = name
        self.group = group
    }
}

class EquipmentBank {
     var list = [Equipment] ()

    init()  {
        list.append(Equipment(name:"rope bridge", group: "balance"))
        list.append(Equipment(name:"balance beam", group: "balance"))
        list.append(Equipment(name:"chin up bar", group: "bar"))
        list.append(Equipment(name:"chin up bars", group: "bar"))
        list.append(Equipment(name:"parallel bars", group: "bar"))
        list.append(Equipment(name:"monkey bars", group: "bar"))
        list.append(Equipment(name:"basketball court", group: "basketBall"))
        list.append(Equipment(name:"play court space with basketball backboard only", group: "basketBall"))
        list.append(Equipment(name:"temporary basketball court with backboard and ring", group: "basketBall"))
        list.append(Equipment(name:"basketball rings", group: "basketBall"))
        list.append(Equipment(name:"carousels", group: "carousel"))
        list.append(Equipment(name:"climbers", group: "climb"))
        list.append(Equipment(name:"rock and rope climbing features", group: "climb"))
        list.append(Equipment(name:"climbing frame", group: "climb"))
        list.append(Equipment(name:"rock wall", group: "climb"))
        list.append(Equipment(name:"grassed areas", group: "greenSafeArea"))
        list.append(Equipment(name:"sports field", group: "greenSafeArea"))
        list.append(Equipment(name:"combination unit", group: "integrated"))
        list.append(Equipment(name:"multi-level play structure", group: "integrated"))
        list.append(Equipment(name:"pirate ship play structure", group: "integrated"))
        list.append(Equipment(name:"combination units", group: "integrated"))
        list.append(Equipment(name:"cubby with slide", group: "slide"))
        list.append(Equipment(name:"fort", group: "integrated"))
        list.append(Equipment(name:"wooden tower", group: "integrated"))
        list.append(Equipment(name:"tic-tac-toe", group: "mini-game"))
        list.append(Equipment(name:"abacus", group: "mini-game"))
        list.append(Equipment(name:"chalkboard", group: "mini-game"))
        list.append(Equipment(name:"musical wall", group: "mini-game"))
        list.append(Equipment(name:"bells", group: "mini-game"))
        list.append(Equipment(name:"speaking tubes", group: "mini-game"))
        list.append(Equipment(name:"spinner", group: "spinners"))
        list.append(Equipment(name:"spinners", group: "spinners"))
        list.append(Equipment(name:"spring rocker", group: "rockerGroup"))
        list.append(Equipment(name:"rockers", group: "rockerGroup"))
        list.append(Equipment(name:"rocker", group: "rockerGroup"))
        list.append(Equipment(name:"rocking table", group: "rockerGroup"))
        list.append(Equipment(name:"spring rider", group: "rockerGroup"))
        list.append(Equipment(name:"spring riders", group: "rockerGroup"))
        list.append(Equipment(name:"sandplay toy", group: "sand"))
        list.append(Equipment(name:"sandpits", group: "sand"))
        list.append(Equipment(name:"sandpit with diggers", group: "sand"))
        list.append(Equipment(name:"sandpit", group: "sand"))
        list.append(Equipment(name:"see-saw", group: "see-sawGroup"))
        list.append(Equipment(name:"see saw", group: "see-sawGroup"))
        list.append(Equipment(name:"see saws", group: "see-sawGroup"))
        list.append(Equipment(name:"concrete skate ramp", group: "skate"))
        list.append(Equipment(name:"skate park", group: "skate"))
        list.append(Equipment(name:"bmx track", group: "skate"))
        list.append(Equipment(name:"cubby-like structures with climbing and sliding challenges", group: "slide"))
        list.append(Equipment(name:"slide", group: "slide"))
        list.append(Equipment(name:"double slide", group: "slide"))
        list.append(Equipment(name:"spiral slide", group: "slide"))
        list.append(Equipment(name:"carousel and slide", group: "slide"))
        list.append(Equipment(name:"toddler playspace - slide", group: "slide"))
        list.append(Equipment(name:"slides", group: "slide"))
        list.append(Equipment(name:"slide and climbing features", group: "slide"))
        list.append(Equipment(name:"dragon slide", group: "slide"))
        list.append(Equipment(name:"swings", group: "swingGroup"))
        list.append(Equipment(name:"swing", group: "swingGroup"))
        list.append(Equipment(name:"swinging hammocks", group: "swingGroup"))
        list.append(Equipment(name:"rocking swing", group: "swingGroup"))
        list.append(Equipment(name:"giraffe swing", group: "swingGroup"))
        list.append(Equipment(name:"boardwalk", group: "track"))
        list.append(Equipment(name:"fitness track", group: "track"))
        list.append(Equipment(name:"tunnels and barrels", group: "tunnelsAndBarrels"))
        list.append(Equipment(name:"tunnels", group: "tunnelsAndBarrels"))
    }
}
