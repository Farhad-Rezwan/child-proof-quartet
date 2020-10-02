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
    var introMessage: String = "hereIsYourFinalScore"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showInformation()
    }

    func showInformation() {
        
        scoreBoardScore.text = score
        showUserName.text = user?.name
        
        var scoreAvatarImage: String = (user?.avatarName)!

        switch scoreAvatarImage {
        case "zacIntro":
            scoreAvatarImage = "zacScore"
            let buttonImage = UIImage(named: scoreAvatarImage)
            tipsButtonPicture.setBackgroundImage(buttonImage, for: .normal)
        case "krisIntro":
            scoreAvatarImage = "krisScore"
            let buttonImage = UIImage(named: scoreAvatarImage)
            tipsButtonPicture.setBackgroundImage(buttonImage, for: .normal)
        case "rezIntro":
            scoreAvatarImage = "rezScore"
            let buttonImage = UIImage(named: scoreAvatarImage)
            tipsButtonPicture.setBackgroundImage(buttonImage, for: .normal)
        default:
            break
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let pathToSound = Bundle.main.path(forResource: introMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        audioPlayer?.stop()
    }
    

    @IBAction func tipsButtonAction(_ sender: Any) {
        
    }
    
}
