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

    @IBOutlet weak var iteration3Avatar: UIImageView!
    
    var audioPlayer: AVAudioPlayer?
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let screenAvatar: String = userName {
            iteration3Avatar.image = UIImage(named: screenAvatar + "Journey")
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
        
        // audio to welcome main journey
        let pathToSound = Bundle.main.path(forResource: Constants.Sound.mainJourneyWelcomeMessage, ofType: "wav")!
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
        
        /// stopw the welcome message when user moves to another screen
        audioPlayer?.stop()
    }
    
    /// sends user name of user.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.journeyToThingCarry {
            let destination = segue.destination as! ThingsToCarryViewController
            destination.userName = userName
        }
    }
}
