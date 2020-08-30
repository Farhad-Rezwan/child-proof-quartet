//
//  WelcomeQuizViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 26/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class WelcomeQuizViewController: UIViewController {
    @IBAction func quizStartButton(_ sender: Any) {
        performSegue(withIdentifier: "quizViewSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
