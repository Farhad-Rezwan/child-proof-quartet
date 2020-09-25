//
//  WelcomeQuizViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 26/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class WelcomeQuizViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    @IBAction func quizStartButton(_ sender: Any) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        handleTransitionQuestionType(type: "general")
    }
    
    @IBAction func safetyQuizStartButton(_ sender: Any) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        handleTransitionQuestionType(type: "safety")
    }
    @IBAction func weatherQuizStartButton(_ sender: Any) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        handleTransitionQuestionType(type: "weather")
    }
    
    func handleTransitionQuestionType(type: String) {
        let viewController = storyboard?.instantiateViewController(identifier: "questionViewController") as! QuestionViewController
        viewController.qType = type
        
        
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }


}
