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
    @IBOutlet weak var questionLabel: UILabel!
//    @IBOutlet var tipsItemView: UIView!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var tipsImageView: UIImageView!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var selectionNumber: Int = 0
    var selectedAnswer: Int = 0
    var score: Int = 0
    
//    let popUpWindow: TipsView = {
//        
//        let view = TipsView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 5
//        
//        return view
//    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        effect = visualEffectView.effect
//        visualEffectView.effect = nil
//        visualEffectView.sendSubviewToBack(sendBackView)
//        tipsItemView.layer.cornerRadius = 5
        
        
        updateQuestion()
        updateUI()
//        view.addSubview(popUpWindow)

        

        // sets the size of the blur view to the equal to ovarall
        blurView.bounds = self.view.bounds
        
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.90, height: self.view.bounds.height * 0.60)
        
        
    }
    


    @IBAction func answerPress(_ sender: UIButton) {
        if sender.tag == 1 {
            animateIn(desiredView: blurView)
            animateIn(desiredView: popUpView)
            let optionATipsImageName: String = allQuestions.list[questionNumber].optionATips
            let tipsImage = UIImage(named: optionATipsImageName)

            tipsImageView.image = tipsImage
        } else if sender.tag == 2 {
            animateIn(desiredView: blurView)
            animateIn(desiredView: popUpView)
            let optionBTipsImageName: String = allQuestions.list[questionNumber].optionBTips
            let tipsImage = UIImage(named: optionBTipsImageName)

            tipsImageView.image = tipsImage

            
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

    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
    
    
    
//    // rotate screen
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
//    }
//
//    override open var shouldAutorotate: Bool {
//        return false
//    }
//
//    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .landscapeLeft
//    }
//
//    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        return .landscapeLeft
//
//    }
//
//
//}

//extension UINavigationController {
//    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return topViewController?.supportedInterfaceOrientations ?? .allButUpsideDown
//    }
//}
    
    
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
    }
    
    
    
    
    @IBAction func tipsDoneButton(_ sender: Any) {
        animateOut(desiredView: popUpView)
        animateOut(desiredView: blurView)
    }
    
}
