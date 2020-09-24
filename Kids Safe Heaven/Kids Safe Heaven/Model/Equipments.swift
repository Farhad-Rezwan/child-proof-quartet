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
        list.append(Equipment(name:"rope bridge", group: "balanceGroup"))
        list.append(Equipment(name:"balance beam", group: "balanceGroup"))
        list.append(Equipment(name:"chin up bar", group: "barGroup"))
        list.append(Equipment(name:"chin up bars", group: "barGroup"))
        list.append(Equipment(name:"parallel bars", group: "barGroup"))
        list.append(Equipment(name:"monkey bars", group: "barGroup"))
        list.append(Equipment(name:"basketball court", group: "basketBallGroup"))
        list.append(Equipment(name:"play court space with basketball backboard only", group: "basketBallGroup"))
        list.append(Equipment(name:"temporary basketball court with backboard and ring", group: "basketBallGroup"))
        list.append(Equipment(name:"basketball rings", group: "basketBallGroup"))
        list.append(Equipment(name:"carousels", group: "carouselGroup"))
        list.append(Equipment(name:"climbers", group: "climbGroup"))
        list.append(Equipment(name:"rock and rope climbing features", group: "climbGroup"))
        list.append(Equipment(name:"climbing frame", group: "climbGroup"))
        list.append(Equipment(name:"rock wall", group: "climbGroup"))
        list.append(Equipment(name:"grassed areas", group: "greenSafeAreaGroup"))
        list.append(Equipment(name:"sports field", group: "greenSafeAreaGroup"))
        list.append(Equipment(name:"combination unit", group: "integratedGroup"))
        list.append(Equipment(name:"multi-level play structure", group: "integratedGroup"))
        list.append(Equipment(name:"pirate ship play structure", group: "integratedGroup"))
        list.append(Equipment(name:"combination units", group: "integratedGroup"))
        list.append(Equipment(name:"cubby with slide", group: "slideGroup"))
        list.append(Equipment(name:"fort", group: "integratedGroup"))
        list.append(Equipment(name:"wooden tower", group: "integratedGroup"))
        list.append(Equipment(name:"tic-tac-toe", group: "mini-gameGroup"))
        list.append(Equipment(name:"abacus", group: "mini-gameGroup"))
        list.append(Equipment(name:"chalkboard", group: "mini-gameGroup"))
        list.append(Equipment(name:"musical wall", group: "mini-gameGroup"))
        list.append(Equipment(name:"bells", group: "mini-gameGroup"))
        list.append(Equipment(name:"speaking tubes", group: "mini-gameGroup"))
        list.append(Equipment(name:"spinner", group: "spinnersGroup"))
        list.append(Equipment(name:"spinners", group: "spinnersGroup"))
        list.append(Equipment(name:"spring rocker", group: "rockerGroup"))
        list.append(Equipment(name:"rockers", group: "rockerGroup"))
        list.append(Equipment(name:"rocker", group: "rockerGroup"))
        list.append(Equipment(name:"rocking table", group: "rockerGroup"))
        list.append(Equipment(name:"spring rider", group: "rockerGroup"))
        list.append(Equipment(name:"spring riders", group: "rockerGroup"))
        list.append(Equipment(name:"sandplay toy", group: "sandGroup"))
        list.append(Equipment(name:"sandpits", group: "sandGroup"))
        list.append(Equipment(name:"sandpit with diggers", group: "sandGroup"))
        list.append(Equipment(name:"sandpit", group: "sandGroup"))
        list.append(Equipment(name:"see-saw", group: "see-sawGroup"))
        list.append(Equipment(name:"see saw", group: "see-sawGroup"))
        list.append(Equipment(name:"see saws", group: "see-sawGroup"))
        list.append(Equipment(name:"concrete skate ramp", group: "skateGroup"))
        list.append(Equipment(name:"skate park", group: "skateGroup"))
        list.append(Equipment(name:"bmx track", group: "skateGroup"))
        list.append(Equipment(name:"cubby-like structures with climbing and sliding challenges", group: "slideGroup"))
        list.append(Equipment(name:"slide", group: "slideGroup"))
        list.append(Equipment(name:"double slide", group: "slideGroup"))
        list.append(Equipment(name:"spiral slide", group: "slideGroup"))
        list.append(Equipment(name:"carousel and slide", group: "slideGroup"))
        list.append(Equipment(name:"toddler playspace - slide", group: "slideGroup"))
        list.append(Equipment(name:"slides", group: "slideGroup"))
        list.append(Equipment(name:"slide and climbing features", group: "slideGroup"))
        list.append(Equipment(name:"dragon slide", group: "slideGroup"))
        list.append(Equipment(name:"swings", group: "swingGroup"))
        list.append(Equipment(name:"swing", group: "swingGroup"))
        list.append(Equipment(name:"swinging hammocks", group: "swingGroup"))
        list.append(Equipment(name:"rocking swing", group: "swingGroup"))
        list.append(Equipment(name:"giraffe swing", group: "swingGroup"))
        list.append(Equipment(name:"boardwalk", group: "trackGroup"))
        list.append(Equipment(name:"fitness track", group: "trackGroup"))
        list.append(Equipment(name:"tunnels and barrels", group: "tunnelsAndBarrelsGroup"))
        list.append(Equipment(name:"tunnels", group: "tunnelsAndBarrelsGroup"))
    }
}
