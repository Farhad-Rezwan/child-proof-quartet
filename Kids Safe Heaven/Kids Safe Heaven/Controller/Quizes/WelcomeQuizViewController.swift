//
//  WelcomeQuizViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 26/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

class WelcomeQuizViewController: UIViewController {
    
    @IBOutlet weak var heyLabel: UILabel!
    @IBOutlet weak var roadSafetyButton: UIButton!
    @IBOutlet weak var weatherSafetyButton: UIButton!
    
    
    
    var user: User?
    var audioPlayer: AVAudioPlayer?
    var introMessage: String = Constants.Sound.welcomeQuizWelcomeMessage
    weak var databaseController: DatabaseProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// assigns user name to the weleome string
        let userName: String = user?.name ?? " "
        heyLabel.text = "Hello, \(userName)!! Select One Quiz Category"
        
        // welcome and asks for choosing quiz catagory
        /// plays introduction message
        let pathToSound = Bundle.main.path(forResource: introMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
        self.navigationController?.navigationBar.isHidden = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        lockFunctionality()
        
        
    }
    
    func lockFunctionality() {
        if user?.generalDone == false {
            roadSafetyButton.setBackgroundImage(UIImage(named: "secondHalf3_"), for: .normal)
            roadSafetyButton.isEnabled = false
            weatherSafetyButton.setBackgroundImage(UIImage(named: "secondHalf4_"), for: .normal)
            weatherSafetyButton.isEnabled = false
        } else if user?.roadSafetyDone == false {
            roadSafetyButton.setBackgroundImage(UIImage(named: "secondHalf3"), for: .normal)
            weatherSafetyButton.setBackgroundImage(UIImage(named: "secondHalf4_"), for: .normal)
            weatherSafetyButton.isEnabled = false
            roadSafetyButton.isEnabled = true
        } else {
            roadSafetyButton.setBackgroundImage(UIImage(named: "secondHalf3"), for: .normal)
            weatherSafetyButton.setBackgroundImage(UIImage(named: "secondHalf4"), for: .normal)
            weatherSafetyButton.isEnabled = true
            roadSafetyButton.isEnabled = true
        }
    }
    
    /// user selects any of the quiz button
    @IBAction func anyQuizCatagoryChoosen(_ sender: UIButton) {
        
        /// gives user with selection haptic feedback
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()

        /// depending on the user selection pushes new view controller of quiz question = Q
        switch sender.tag {
        case 0:
            handleTransitionQuestionType(type: "general")
            break
        case 1:
            handleTransitionQuestionType(type: "safetySigns")
            break
        case 2:
            handleTransitionQuestionType(type: "weather")
            break
        default:
            break
        }
    }
    
    /// Assigns and pushes new view controller
    /// - Parameter type: type of question user choosen
    func handleTransitionQuestionType(type: String) {
        let viewController = storyboard?.instantiateViewController(identifier: "questionViewController") as! QuestionViewController
        viewController.qType = type
        viewController.user = user
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /// stops audio when user moves to the other screen
        audioPlayer?.stop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lockFunctionality()
        
    }


}
