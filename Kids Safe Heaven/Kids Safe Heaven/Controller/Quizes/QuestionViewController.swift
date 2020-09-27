//
//  QuestionViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 24/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

class QuestionViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

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
    var qType: String?
    
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

        let backArrowImage = UIImage(named: "quizBack")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backIndicatorImage = renderedImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    /// Does, after answer pressed if correct, proper tips message is shown, with score update and haptic feedback
    /// - Parameter sender: UIButton
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
            
            /// taptic feedback correct
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
            score += 1
            let pathToSound = Bundle.main.path(forResource: "correct", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer!.play()
            } catch {
                print("error playing")
            }
        } else {
            
            /// Taptic Feedback wrong
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            
            let pathToSound = Bundle.main.path(forResource: "wrong", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer!.play()
            } catch {
                print("error playing")
            }
        }
        questionNumber += 1
    }
    
    func updateQuestion() {
        if allQuestions == nil {
            loadQuestions()
        }
        
        // here the change
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



            selectedAnswer = allQuestions[questionNumber].corretAnswer
            
        } else {
            

            let alert = UIAlertController(title: "Awesome", message: "End of quiz. do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (action) in
                self.restartQuiz()
            }
            let anotherAction = UIAlertAction(title: "Done", style: .default) { (action) in
                
                self.navigateToScorecard()
            }
            alert.addAction(restartAction)
            alert.addAction(anotherAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func updateUI() {
        
        if questionNumber <= allQuestions.count - 1 {
            scoreLabel.text = "Score: \(score)"
            questionCounter.text = "\(questionNumber + 1)/\(allQuestions.count)"
            progressView.progress = progressView.progress + 0.10
            
        }
    }
    
    func restartQuiz() {
        progressView.progress = 0
        questionNumber = 0
        score = 0
        updateUI()
        
        allQuestions = nil
        updateQuestion()
    }
    
    func navigateToScorecard() {
        let viewController = storyboard?.instantiateViewController(identifier: "scoreBoardVC") as! ScoreBoardViewController
        viewController.score = String(score)
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    func loadQuestions() {
        let exampleArray = QuestionBank(type: qType ?? "general").list
        let newArray = exampleArray.shuffled()
        let uniqueRandomArraySlice = Array(ArraySlice(newArray)).prefix(5)
        allQuestions = uniqueRandomArraySlice
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
    

    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
        
    }
    
    
    
    
    @IBAction func tipsDoneButton(_ sender: Any) {
        updateUI()
        updateQuestion()
        animateOut(desiredView: blurView)
        animateOut(desiredView: popUpView)
        
    }
    
    @IBAction func returnTabBarFromquiz(_ sender: Any) {
    }
    
}
