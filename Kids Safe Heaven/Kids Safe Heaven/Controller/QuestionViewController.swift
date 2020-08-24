//
//  QuestionViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 24/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
   
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
//    /outlet for b uttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var selectionNumber: Int = 0
    var selectedAnswer: Int = 0
    var score: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()

        // Do any additional setup after loading the view.
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("CorrECT")
        } else {
            print("FalsE")
        }
        
        questionNumber += 1
        updateQuestion()

    }
    
    func updateQuestion() {

        if questionNumber <= allQuestions.list.count - 1 {
            
            flagView.image = UIImage(named: (allQuestions.list[questionNumber].questionImage))
            questionLabel.text = allQuestions.list[questionNumber].question
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: .normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: .normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: .normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: .normal)
            
            selectedAnswer = allQuestions.list[questionNumber].corretAnswer
        } else {
            let alert = UIAlertController(title: "Awesome", message: "End of quiz. do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()

    }
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        // progress value
        
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
}
