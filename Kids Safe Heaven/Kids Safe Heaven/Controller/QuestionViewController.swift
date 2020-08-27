//
//  QuestionViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 24/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var sendBackView: UIView!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
   
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var tipsItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect:UIVisualEffect!
    @IBAction func dismissPopUp(_ sender: Any) {
        animateOut()
    }
    //    /outlet for b uttons

    @IBOutlet weak var optionA: UIButton!
    
    @IBOutlet weak var optionB: UIButton!
    

    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var selectionNumber: Int = 0
    var selectedAnswer: Int = 0
    var score: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        effect = visualEffectView.effect
//        visualEffectView.effect = nil
//        visualEffectView.sendSubviewToBack(sendBackView)
//        tipsItemView.layer.cornerRadius = 5
        
        
        updateQuestion()
        updateUI()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func animateIn() {
        self.view.addSubview(tipsItemView)
        tipsItemView.center = self.view.center
        
        tipsItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        tipsItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.tipsItemView.alpha = 1
            self.tipsItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        visualEffectView.sendSubviewToBack(sendBackView)
        UIView.animate(withDuration: 0.3, animations: {
            self.tipsItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.tipsItemView.alpha = 0
            
            self.visualEffectView.effect = nil
            
        }, completion: { (success: Bool) in
            self.tipsItemView.removeFromSuperview()
        })
    }


    @IBAction func answerPress(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
//            animateIn()
            print("CorrECT")
        } else {
            print("FalsE")
        }
        
        questionNumber += 1
        updateQuestion()
    }
    func updateQuestion() {
        if questionNumber <= allQuestions.list.count - 1 {
            
            questionLabel.text = allQuestions.list[questionNumber].question
            
            let optionAImageName: String = allQuestions.list[questionNumber].optionAImage
            let btnAImage = UIImage(named: optionAImageName)

            optionA.setImage(btnAImage, for: .normal)
            optionA.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            optionA.contentVerticalAlignment = .fill
            optionA.contentHorizontalAlignment = .fill

            let optionBImageName: String = allQuestions.list[questionNumber].optionBImage
            let btnBImage = UIImage(named: optionBImageName)
            
            optionB.setImage(btnBImage, for: .normal)
            optionB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            optionB.contentVerticalAlignment = .fill
            optionB.contentHorizontalAlignment = .fill


            optionA.setTitle("", for: .normal)
            optionB.setTitle("", for: .normal)
            
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
    
    
    
    // rotate screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
        
    }
    
    @IBAction func barBAction(_ sender: Any) {
            animateIn()
    }
    
}

extension UINavigationController {
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .allButUpsideDown
    }
}
