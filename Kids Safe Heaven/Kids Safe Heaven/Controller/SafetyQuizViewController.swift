//
//  SafetyQuizViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 31/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class SafetyQuizViewController: UIViewController {
    
        @IBOutlet weak var questionCounter: UILabel!
        @IBOutlet weak var scoreLabel: UILabel!
        @IBOutlet weak var progressView: UIProgressView!
        @IBOutlet weak var questionLabel: UILabel!
    //    @IBOutlet var tipsItemView: UIView!
        @IBOutlet weak var optionA: UIButton!
        @IBOutlet weak var optionB: UIButton!
        
        @IBOutlet var blurView: UIVisualEffectView!
        @IBOutlet var popUpView: UIView!
        @IBOutlet weak var tipsImageView: UIImageView!
        
    //    let allQuestions = QuestionBank(type: "general").list.shuffled().prefix(5)
        var allQuestions: ArraySlice<Question>!
        var questionNumber: Int = 0
        var selectionNumber: Int = 0
        var selectedAnswer: Int = 0
        var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0
        updateQuestion()
        updateUI()
        blurView.bounds = self.view.bounds
        
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.90, height: self.view.bounds.height * 0.60)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    
    
    
    
    
    
    @IBAction func answerPress(_ sender: UIButton) {
        if sender.tag == 1 {
            animateIn(desiredView: blurView)
            animateIn(desiredView: popUpView)
            let optionATipsImageName: String = allQuestions[questionNumber].optionATips
            let tipsImage = UIImage(named: optionATipsImageName)

            tipsImageView.image = tipsImage
        } else if sender.tag == 2 {
            animateIn(desiredView: blurView)
            animateIn(desiredView: popUpView)
            let optionBTipsImageName: String = allQuestions[questionNumber].optionBTips
            let tipsImage = UIImage(named: optionBTipsImageName)

            tipsImageView.image = tipsImage
        }
        
        if sender.tag == selectedAnswer {
            score += 1
        }
        
        
        
        questionNumber += 1
        
    }
    func updateQuestion() {
        allQuestions = QuestionBank(type: "safety").list.prefix(3)
        if questionNumber <= allQuestions.count - 1 {
            
            questionLabel.text = allQuestions[questionNumber].question
            
            let optionAImageName: String = allQuestions[questionNumber].optionAImage
            let btnAImage = UIImage(named: optionAImageName)

            optionA.setImage(btnAImage, for: .normal)
            optionA.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            optionA.contentVerticalAlignment = .fill
            optionA.contentHorizontalAlignment = .fill

            let optionBImageName: String = allQuestions[questionNumber].optionBImage
            let btnBImage = UIImage(named: optionBImageName)
            
            optionB.setImage(btnBImage, for: .normal)
            optionB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            optionB.contentVerticalAlignment = .fill
            optionB.contentHorizontalAlignment = .fill


            optionA.setTitle(allQuestions[questionNumber].optionA, for: .normal)
            optionB.setTitle(allQuestions[questionNumber].optionB, for: .normal)
            
            selectedAnswer = allQuestions[questionNumber].corretAnswer
            
        } else {
            allQuestions = QuestionBank(type: "safety").list.prefix(3)
            progressView.progress = 0
            let alert = UIAlertController(title: "Awesome", message: "End of quiz. do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            navigationController?.popViewController(animated: true)
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        

    }
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.count)"
        progressView.progress = progressView.progress + 0.10

    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }

    func animateIn(desiredView: UIView) {
        let backgroundView = self.view!
        
        // attach our desired view to the screen (self?.view/backgroundView)
        backgroundView.addSubview(desiredView)
        
        // 20% bigger so looks like zooming out and in
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        // animate the effect
        UIView.animate(withDuration: 0.3, animations: {
            // after 0.3 sec this will happen
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
        
        


    }
    
    // animate out a specified view
    
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
        updateUI()
        updateQuestion()
    }
    
    
    
    
    @IBAction func tipsDoneButton(_ sender: Any) {
        animateOut(desiredView: popUpView)
        animateOut(desiredView: blurView)
    }
    
}
