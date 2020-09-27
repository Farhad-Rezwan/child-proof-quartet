//
//  ScoreBoardViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 27/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController {

    @IBOutlet weak var scoreBoardScore: UILabel!
    var score: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreBoardScore.text = score

    }
    


}
