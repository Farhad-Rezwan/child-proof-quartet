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
    var user: User?
    var audioPlayer: AVAudioPlayer?
    var introMessage: String = "selectOneQuizCatagory"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
        
        let userName: String = user?.name ?? " "
        heyLabel.text = "Hello, \(userName)!! Select One Quiz Category"
        
        
        // welcome and asks for choosing quiz catagory
        let pathToSound = Bundle.main.path(forResource: introMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }

    }
    @IBAction func quizStartButton(_ sender: Any) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        handleTransitionQuestionType(type: "general")
    }
    
    @IBAction func safetyQuizStartButton(_ sender: Any) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        handleTransitionQuestionType(type: "safetySigns")
    }
    @IBAction func weatherQuizStartButton(_ sender: Any) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        handleTransitionQuestionType(type: "weather")
    }
    
    func handleTransitionQuestionType(type: String) {
        let viewController = storyboard?.instantiateViewController(identifier: "questionViewController") as! QuestionViewController
        viewController.qType = type
        viewController.user = user
        

        
        navigationController?.pushViewController(viewController, animated: true)
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
        
        audioPlayer?.stop()
    }


}
