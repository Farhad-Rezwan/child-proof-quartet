//
//  HomeScreenViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 30/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AVFoundation

class HomeScreenViewController: UIViewController, DatabaseListener{
    
    var audioPlayer: AVAudioPlayer?
    weak var databaseController: DatabaseProtocol?
    
    var listenerType: ListenerType = .all
    var user: User?
    
    @IBOutlet weak var openerAvater: UIImageView!
    
    @IBAction func quizButton(_ sender: Any) {
    }
    @IBAction func locationButton(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        /// database delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController

        if let user = user {
            let openerStr = (user.avatarName)! + "IntroHC"
            openerAvater.image = UIImage(named: openerStr)
            
            return
        }
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        /// playing introduction sound
        let pathToSound = Bundle.main.path(forResource: Constants.Sound.homeScreenWelcomeMessage, ofType: "wav")!
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
        
        /// stop introduction sound when user goes to another screen
        audioPlayer?.stop()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.homeToSearchPark {
            let destination = segue.destination as! SearhParkCollectionViewController
            destination.userName = user?.avatarName
        } else if segue.identifier == Constants.Segue.homeToGame {
            let destination = segue.destination as! MainJourneyViewController
            destination.user = user
        }
    }
    
    /// Database Delegate Methods
    /// do nothing
    func onUserScoreChange(change: DatabaseChange, userScore: [Score]) {}
    func onUserListChange(change: DatabaseChange, users: [User]) {}
}
