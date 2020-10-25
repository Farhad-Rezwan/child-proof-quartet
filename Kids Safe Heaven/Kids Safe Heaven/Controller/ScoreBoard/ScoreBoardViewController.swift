//
//  ScoreBoardViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 27/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

class ScoreBoardViewController: UIViewController {
    
    @IBOutlet weak var questionTypeTVLabel: UILabel!
    @IBOutlet weak var showUserName: UILabel!
    @IBOutlet weak var tipsButtonPicture: UIButton!
    @IBOutlet weak var scoreBoardScore: UILabel!
    
    var user: User?
    var score: String?
    var questionType: String?
    var audioPlayer: AVAudioPlayer?
    var introMessage: String = Constants.Sound.scoreBooardVCMessage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInformation()
    }
    
    /// Defines the view controller design and populates information, depending on question type
    func showInformation() {
        
        scoreBoardScore.text = score
        showUserName.text = user?.name
        
        if let scoreAvatarImage: String = (user?.avatarName) {
            let buttonImage = UIImage(named: scoreAvatarImage + "Score")
            tipsButtonPicture.setBackgroundImage(buttonImage, for: .normal)
        }
        
        switch questionType {
        case "general":
            questionTypeTVLabel.text = "General Safety"
            break
        case "safetySigns":
            questionTypeTVLabel.text = "Road Safety"
            break
        case "weather":
            questionTypeTVLabel.text = "Weather Safety"
            break
        default:
            questionTypeTVLabel.text = " "
            break
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /// stops readout message
        audioPlayer?.stop()
    }
    

    @IBAction func tipsButtonAction(_ sender: Any) {
        
        /// stops readout message when avatar is pressed
        audioPlayer?.stop()
        
        /// plays the readout message
        let pathToSound = Bundle.main.path(forResource: introMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
    }
    
}
