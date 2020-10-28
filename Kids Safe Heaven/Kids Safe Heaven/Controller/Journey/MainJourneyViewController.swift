//
//  MainJourneyViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 7/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class MainJourneyViewController: UIViewController {

    @IBOutlet weak var thingsToCarryButton: UIButton!
    @IBOutlet weak var knowTheDangerButton: UIButton!
    @IBOutlet weak var textMessage: UILabel!
    
    var audioPlayer: AVAudioPlayer?
    var user: User?
    var currentLocation: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///disabling the things to carry section when the location is not found
        thingsToCarryButton.isEnabled = false
        enableThingsToCarry()
        
        // audio to welcome main journey
        let pathToSound = Bundle.main.path(forResource: Constants.Sound.mainJourneyWelcomeMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
        
        self.navigationController?.navigationBar.isHidden = false
        lockFunctionality()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lockFunctionality()

        /// check for location is found, if found enable the thingsToCarrry button
        enableThingsToCarry()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /// stopw the welcome message when user moves to another screen
        audioPlayer?.stop()
    }
    
    func lockFunctionality() {
        if user?.generalDone == false {
            thingsToCarryButton.setBackgroundImage(UIImage(named: "thingsToCarryButtonLocked"), for: .normal)
            thingsToCarryButton.isEnabled = false
            knowTheDangerButton.setBackgroundImage(UIImage(named: "knowTheDangerButtonLocked"), for: .normal)
            knowTheDangerButton.isEnabled = false
        } else if user?.thingsDone == false {
            thingsToCarryButton.setBackgroundImage(UIImage(named: "thingsToCarryButton"), for: .normal)
            knowTheDangerButton.setBackgroundImage(UIImage(named: "knowTheDangerButtonLocked"), for: .normal)
            knowTheDangerButton.isEnabled = false
            thingsToCarryButton.isEnabled = true
        } else {
            thingsToCarryButton.setBackgroundImage(UIImage(named: "thingsToCarryButton"), for: .normal)
            knowTheDangerButton.setBackgroundImage(UIImage(named: "knowTheDangerButton"), for: .normal)
            knowTheDangerButton.isEnabled = true
            thingsToCarryButton.isEnabled = true
            textMessage.text = "Let's begin your Journey by learning"
        }
    }
    
    func enableThingsToCarry() {
        if currentLocation?.latitude != nil && currentLocation?.latitude != 0 {
//            thingsToCarryButton.isEnabled = true
            
        }
    }
    
    /// sends user name of user.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.journeyToThingsToCarry {
            let destination = segue.destination as! ThingsToCarryViewController
            destination.currentLocation = currentLocation
            destination.user = user
        } else if segue.identifier == Constants.Segue.journeyToQuiz {
            let destination = segue.destination as! WelcomeQuizViewController
            destination.user = user
        }
    }
    
    @IBAction func thingsToCarryClicked(_ sender: Any) {
        /// gives user with selection haptic feedback
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
    
}
