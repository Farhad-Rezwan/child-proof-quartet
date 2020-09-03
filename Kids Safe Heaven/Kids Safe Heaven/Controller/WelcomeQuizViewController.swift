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
    }
    
    @IBAction func safetyQuizStartButton(_ sender: Any) {
    }
    @IBAction func weatherQuizStartButton(_ sender: Any) {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }


}
