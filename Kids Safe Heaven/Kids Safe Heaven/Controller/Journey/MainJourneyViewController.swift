//
//  MainJourneyViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 7/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

class MainJourneyViewController: UIViewController {

    var introMessage = "it3SoundIntroduction"
    var audioPlayer: AVAudioPlayer?
    var userName: String?
    @IBOutlet weak var iteration3Avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var it3Avatar: String = userName ?? "zacIntro"

        switch it3Avatar {
        case "zacIntro":
            it3Avatar = "IT3Zac"
            iteration3Avatar.image = UIImage(named: it3Avatar)
        case "krisIntro":
            it3Avatar = "IT3Kris"
            iteration3Avatar.image = UIImage(named: it3Avatar)
        case "rezIntro":
            it3Avatar = "IT3Rez"
            iteration3Avatar.image = UIImage(named: it3Avatar)
        default:
            iteration3Avatar.image = UIImage(named: it3Avatar)
            break
        }
        
        
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //  Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        // audio
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userNamePass" {
            let destination = segue.destination as! ThingsToCarryViewController
            destination.userName = userName
        }
    }
}
