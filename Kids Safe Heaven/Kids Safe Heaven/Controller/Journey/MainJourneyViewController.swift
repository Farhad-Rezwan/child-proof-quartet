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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


        /// check for location is found, if found enable the thingsToCarrry button
        enableThingsToCarry()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /// stopw the welcome message when user moves to another screen
        audioPlayer?.stop()
    }
    
    func enableThingsToCarry() {
        if currentLocation?.latitude != nil && currentLocation?.latitude != 0 {
            thingsToCarryButton.isEnabled = true
            
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
        print("disabled but clicked")
    }
    
    
}
