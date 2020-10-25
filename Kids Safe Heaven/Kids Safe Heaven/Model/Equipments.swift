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
    var instrVideoLink: String

    init(name: String, group: String, instrVideoLink: String) {
        self.name = name
        self.group = group
        self.instrVideoLink = instrVideoLink
    }
}

class EquipmentBank {
     var list = [Equipment] ()

    init()  {
        // MARK: - balanceGroup
        list.append(Equipment(name:"rope bridge", group: "balanceGroup", instrVideoLink: ""))
        list.append(Equipment(name:"balance beam", group: "balanceGroup", instrVideoLink: ""))
        // MARK: - barGroup
        list.append(Equipment(name:"chin up bar", group: "barGroup", instrVideoLink: "l0UVw1tD9PY"))
        list.append(Equipment(name:"chin up bars", group: "barGroup", instrVideoLink: "l0UVw1tD9PY"))
        list.append(Equipment(name:"parallel bars", group: "barGroup", instrVideoLink: "l0UVw1tD9PY"))
        list.append(Equipment(name:"monkey bars", group: "barGroup", instrVideoLink: "l0UVw1tD9PY"))
        // MARK: - basketBallGroup
        list.append(Equipment(name:"basketball court", group: "basketBallGroup", instrVideoLink: "CeN_bLSiU5k"))
        list.append(Equipment(name:"play court space with basketball backboard only", group: "basketBallGroup", instrVideoLink: "CeN_bLSiU5k"))
        list.append(Equipment(name:"temporary basketball court with backboard and ring", group: "basketBallGroup", instrVideoLink: "CeN_bLSiU5k"))
        list.append(Equipment(name:"basketball rings", group: "basketBallGroup", instrVideoLink: "CeN_bLSiU5k"))
        // MARK: - carouselGroup
        list.append(Equipment(name:"carousels", group: "carouselGroup", instrVideoLink: ""))
        // MARK: - climbGroup
        list.append(Equipment(name:"climbers", group: "climbGroup", instrVideoLink: "l0UVw1tD9PY"))
        list.append(Equipment(name:"rock and rope climbing features", group: "climbGroup", instrVideoLink: "l0UVw1tD9PY"))
        list.append(Equipment(name:"climbing frame", group: "climbGroup", instrVideoLink: "l0UVw1tD9PY"))
        list.append(Equipment(name:"rock wall", group: "climbGroup", instrVideoLink: "l0UVw1tD9PY"))
        // MARK: - greenSafeAreaGroup
        list.append(Equipment(name:"grassed areas", group: "greenSafeAreaGroup", instrVideoLink: "l13Zu6nLVgI"))
        list.append(Equipment(name:"sports field", group: "greenSafeAreaGroup", instrVideoLink: "l13Zu6nLVgI"))
        // MARK: - integratedGroup
        list.append(Equipment(name:"combination unit", group: "integratedGroup", instrVideoLink: "VScXbJGvKV8"))
        list.append(Equipment(name:"multi-level play structure", group: "integratedGroup", instrVideoLink: "VScXbJGvKV8"))
        list.append(Equipment(name:"pirate ship play structure", group: "integratedGroup", instrVideoLink: "VScXbJGvKV8"))
        list.append(Equipment(name:"combination units", group: "integratedGroup", instrVideoLink: "VScXbJGvKV8"))
        list.append(Equipment(name:"fort", group: "integratedGroup", instrVideoLink: "VScXbJGvKV8"))
        list.append(Equipment(name:"wooden tower", group: "integratedGroup", instrVideoLink: "VScXbJGvKV8"))
        // MARK: - slideGroup
        list.append(Equipment(name:"cubby with slide", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        // MARK: - spinnersGroup
        list.append(Equipment(name:"spinner", group: "spinnersGroup", instrVideoLink: ""))
        list.append(Equipment(name:"spinners", group: "spinnersGroup", instrVideoLink: ""))
        // MARK: - rockerGroup
        list.append(Equipment(name:"spring rocker", group: "rockerGroup", instrVideoLink: ""))
        list.append(Equipment(name:"rockers", group: "rockerGroup", instrVideoLink: ""))
        list.append(Equipment(name:"rocker", group: "rockerGroup", instrVideoLink: ""))
        list.append(Equipment(name:"rocking table", group: "rockerGroup", instrVideoLink: ""))
        list.append(Equipment(name:"spring rider", group: "rockerGroup", instrVideoLink: ""))
        list.append(Equipment(name:"spring riders", group: "rockerGroup", instrVideoLink: ""))
        // MARK: - sandGroup
        list.append(Equipment(name:"sandplay toy", group: "sandGroup", instrVideoLink: ""))
        list.append(Equipment(name:"sandpits", group: "sandGroup", instrVideoLink: ""))
        list.append(Equipment(name:"sandpit with diggers", group: "sandGroup", instrVideoLink: ""))
        list.append(Equipment(name:"sandpit", group: "sandGroup", instrVideoLink: ""))
        // MARK: - see-sawGroup
        list.append(Equipment(name:"see-saw", group: "see-sawGroup", instrVideoLink: "d6CqqITeBPs"))
        list.append(Equipment(name:"see saw", group: "see-sawGroup", instrVideoLink: "d6CqqITeBPs"))
        list.append(Equipment(name:"see saws", group: "see-sawGroup", instrVideoLink: "d6CqqITeBPs"))
        // MARK: - skateGroup
        list.append(Equipment(name:"concrete skate ramp", group: "skateGroup", instrVideoLink: "VAqQ7LB1THw"))
        list.append(Equipment(name:"skate park", group: "skateGroup", instrVideoLink: "VAqQ7LB1THw"))
        list.append(Equipment(name:"bmx track", group: "skateGroup", instrVideoLink: "VAqQ7LB1THw"))
        // MARK: - slideGroup
        list.append(Equipment(name:"cubby-like structures with climbing and sliding challenges", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"slide", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"double slide", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"spiral slide", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"carousel and slide", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"toddler playspace - slide", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"slides", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"slide and climbing features", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        list.append(Equipment(name:"dragon slide", group: "slideGroup", instrVideoLink: "8QLjyaAJlZM"))
        // MARK: - swingGroup
        list.append(Equipment(name:"swings", group: "swingGroup", instrVideoLink: "vX1mRCnIT3o"))
        list.append(Equipment(name:"1 x 5 way swing", group: "swingGroup", instrVideoLink: "vX1mRCnIT3o"))
        list.append(Equipment(name:"swing", group: "swingGroup", instrVideoLink: "vX1mRCnIT3o"))
        list.append(Equipment(name:"swinging hammocks", group: "swingGroup", instrVideoLink: "vX1mRCnIT3o"))
        list.append(Equipment(name:"rocking swing", group: "swingGroup", instrVideoLink: "vX1mRCnIT3o"))
        list.append(Equipment(name:"giraffe swing", group: "swingGroup", instrVideoLink: "vX1mRCnIT3o"))
        // MARK: - trackGroup
        list.append(Equipment(name:"boardwalk", group: "trackGroup", instrVideoLink: "aNvPWn0JQ8k"))
        list.append(Equipment(name:"fitness track", group: "trackGroup", instrVideoLink: "aNvPWn0JQ8k"))
        // MARK: - tunnelsAndBarrelsGroup
        list.append(Equipment(name:"tunnels and barrels", group: "tunnelsAndBarrelsGroup",instrVideoLink: ""))
        list.append(Equipment(name:"tunnels", group: "tunnelsAndBarrelsGroup", instrVideoLink: ""))
        // MARK: - mini-gameGroup
        list.append(Equipment(name:"tic-tac-toe", group: "tic-tac-toeGroup", instrVideoLink: ""))
        list.append(Equipment(name:"abacus", group: "abacasGroup", instrVideoLink: ""))
        list.append(Equipment(name:"chalkboard", group: "chalkboardGroup", instrVideoLink: ""))
        list.append(Equipment(name:"musical wall", group: "mini-gameGroup", instrVideoLink: ""))
        list.append(Equipment(name:"bells", group: "mini-gameGroup", instrVideoLink: ""))
        list.append(Equipment(name:"speaking tubes", group: "speaking-tubesGroup", instrVideoLink: ""))
    }
}
