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
    var user: User?

    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var tipsImageView: UIImageView!
    @IBOutlet weak var tipsViewTipsAvatarButtonOutlet: UIButton!
    
    var qType: String?
    var allQuestions: ArraySlice<Question>!
    var tempSoundToLoad: String?
    
    /// Variables for displaying and handling proper question to the user
    var questionNumber: Int = 0
    var selectionNumber: Int = 0
    var selectedAnswer: Int = 0
    var score: Int = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// setting boundary for blurView and popUpView
        blurView.bounds = self.view.bounds
        popUpView.bounds = self.view.bounds
        
        progressView.progress = 0

        updateQuestion()
        updateUI()
        populateAvatarOfTipsScreen()
        addCornerAndBorderToOptions()

        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    /// Adds boarder to the options.
    func addCornerAndBorderToOptions() {
        optionA.layer.cornerRadius = 30
        optionA.layer.borderWidth = 4.0
        optionA.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        optionB.layer.cornerRadius = 30
        optionB.layer.borderWidth = 4.0
        optionB.layer.borderColor = UIColor.systemGroupedBackground.cgColor
    }
    
    /// Populates tips screen avatar
    func populateAvatarOfTipsScreen() {
        
        if let tipsAvatarImageString: String = (user?.avatarName) {
            let buttonImage = UIImage(named: tipsAvatarImageString + "ReadOut" )
            tipsViewTipsAvatarButtonOutlet.setBackgroundImage(buttonImage, for: .normal)
        }

    }
    
    /// Does, after answer pressed if correct, proper tips message is shown, with score update and haptic feedback
    /// - Parameter sender: UIButton
    @IBAction func answerPress(_ sender: UIButton) {
        
        /// stops question read out when user selects any of the option
        audioPlayer!.stop()
        
        /// animates in the tips screen
        animateIn(desiredView: blurView)
        animateIn(desiredView: popUpView)
        
        /// Depending on button pressed the tips screen image is populated
        if sender.tag == 1 {
            let optionATipsName: String = allQuestions[questionNumber].optionATips
            let tipsImage = UIImage(named: optionATipsName)
            
            tempSoundToLoad = optionATipsName
            tipsImageView.image = tipsImage
        } else if sender.tag == 2 {
            let optionBTipsName: String = allQuestions[questionNumber].optionBTips
            let tipsImage = UIImage(named: optionBTipsName)

            tempSoundToLoad = optionBTipsName
            tipsImageView.image = tipsImage
        }
        
        /// depending on whether answer is right or wrong gives user with proper feedback of dound effect and haptic feedback
        if sender.tag == selectedAnswer {
            
            /// taptic feedback correct
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
            /// highlight button feedback
            optionA.showsTouchWhenHighlighted = true
            
            /// sound feedback
            let pathToSound = Bundle.main.path(forResource: "correct", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer!.play()
            } catch {
                print("error playing")
            }
            
            /// increases the score by one
            score += 1
        } else {
            
            /// Taptic Feedback wrong
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            /// highlight button feedback
            optionB.showsTouchWhenHighlighted = true
            
            /// sound feedback
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
        /// checks if the question is nil, if nil loads it
        if allQuestions == nil {
            loadQuestions()
        }
        
        /// here the change of question happens
        if questionNumber <= allQuestions.count - 1 {
            
            questionLabel.text = allQuestions[questionNumber].question
            
            /// populating option A
            let optionAImageName: String = allQuestions[questionNumber].optionAImage
            let btnAImage = UIImage(named: optionAImageName)

            optionA.setImage(btnAImage, for: .normal)
            optionA.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            optionA.contentVerticalAlignment = .fill
            optionA.contentHorizontalAlignment = .fill

            /// populating option B
            let optionBImageName: String = allQuestions[questionNumber].optionBImage
            let btnBImage = UIImage(named: optionBImageName)
            
            optionB.setImage(btnBImage, for: .normal)
            optionB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            optionB.contentVerticalAlignment = .fill
            optionB.contentHorizontalAlignment = .fill

            /// setting correct answer
            selectedAnswer = allQuestions[questionNumber].corretAnswer

            /// reads out the question to user
            if let pathToSound = Bundle.main.path(forResource: allQuestions[questionNumber].questionSound, ofType: "wav") {
                let url = URL(fileURLWithPath: pathToSound)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.prepareToPlay()
                    
                } catch let error as NSError {
                        print("error: \(error.localizedDescription)")
                }
                
                let seconds = 0.5//Time To Delay
                let when = DispatchTime.now() + seconds
                
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.audioPlayer!.play()
                }
            }
            
            
        } else {
            
            /// if there is not quiz question left
            let alert = UIAlertController(title: "Awesome", message: "End of quiz. do you want to start over?", preferredStyle: .alert)
            
            /// setting allart with restart and done action
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (action) in
                self.restartQuiz()
            }
            alert.addAction(restartAction)
            let anotherAction = UIAlertAction(title: "Done", style: .default) { (action) in
                
                self.navigateToScorecard()
            }
            alert.addAction(anotherAction)
            
            /// present the alert
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    /// Updates the ui for the user
    func updateUI() {
        if questionNumber <= allQuestions.count - 1 {
            scoreLabel.text = "Score: \(score)"
            questionCounter.text = "\(questionNumber + 1)/\(allQuestions.count)"
            progressView.progress = progressView.progress + 0.20
        }
    }
    
    /// when restart quiz option is pressed
    func restartQuiz() {
        progressView.progress = 0
        questionNumber = 0
        score = 0
        updateUI()
        allQuestions = nil
        updateQuestion()
    }
    
    /// when done in the alert option is pressed, user is sent to score ciew controller
    func navigateToScorecard() {
        let viewController = storyboard?.instantiateViewController(identifier: "scoreBoardVC") as! ScoreBoardViewController
        viewController.score = String(score)
        viewController.user = user
        viewController.questionType = qType ?? "general"
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    /// Loads thequestions with user defined question type
    func loadQuestions() {
        let exampleArray = QuestionBank(type: qType ?? "general").list
        let newArray = exampleArray.shuffled()
        let uniqueRandomArraySlice = Array(ArraySlice(newArray)).prefix(5)
        allQuestions = uniqueRandomArraySlice
    }
    
    /// Animates in blur view or tips view
    /// - Parameter desiredView: View to animate
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
    
    
    /// Animates out the blur view or tips view
    /// - Parameter desiredView: View to animate out
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
    
    /// When user selects tips add
    @IBAction func tipsViewTipsAvatarSpeakOutButton(_ sender: Any) {
        
        if let pathToSound = Bundle.main.path(forResource: tempSoundToLoad, ofType: "wav") {
            let url = URL(fileURLWithPath: pathToSound)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer!.play()
            } catch {
                print("error playing")
            }
        }
    }
    
    
    @IBAction func tipsDoneButton(_ sender: Any) {
        updateUI()
        animateOut(desiredView: blurView)
        animateOut(desiredView: popUpView)
        audioPlayer!.stop()
        updateQuestion()
        
    }

}
