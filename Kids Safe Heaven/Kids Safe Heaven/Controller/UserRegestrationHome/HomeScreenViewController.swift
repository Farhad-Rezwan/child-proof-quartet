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
    var introMessage: String = "introductionAvatarMessage"
    weak var databaseController: DatabaseProtocol?
    var listenerType: ListenerType = .all
    var userName: String?
    var user: User?
    
    @IBOutlet weak var openerAvater: UIImageView!
    @IBAction func quizButton(_ sender: Any) {
    }
    @IBAction func locationButton(_ sender: Any) {
    }
    
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        user = databaseController?.getUser(userName: userName!)
        
        // bug
        var openerStr = user?.avatarName
        openerStr! += "HC"
        openerAvater.image = UIImage(named: openerStr ?? " ")
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = true
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = true
        
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

    func onUserScoreChange(change: DatabaseChange, userScore: [Score]) {
    }
    
    func onUserListChange(change: DatabaseChange, users: [User]) {
        print("user choosen")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSendUserData" {
            let destination = segue.destination as! SearhParkCollectionViewController
            destination.userName = user?.avatarName
        } else if segue.identifier == "quizSectionSegue" {
            let destination = segue.destination as! WelcomeQuizViewController
            destination.user = user
        }
    }
    
    
}
