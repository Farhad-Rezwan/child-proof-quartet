//
//  SafetyTipsViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 15/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

class SafetyTipsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?

    @IBOutlet weak var equipmentView: UIImageView!
    @IBOutlet weak var equipmentName: UILabel!
    @IBOutlet weak var tipsView: UIImageView!
    @IBOutlet weak var tipsReadOutImage: UIButton!
    @IBOutlet weak var hideTheLearnMoreButton: UIButton!
    
    var eqName: String?
    var eqTips: String?
    var userName: String?
    var user: User?
    var eqVideo: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// checks if the video instruction for the equipment is there or not, if not hids the learn more button
        if eqVideo != "" {
            hideTheLearnMoreButton.isHidden = false
        } else {
            hideTheLearnMoreButton.isHidden = true
        }
        
        /// decorates the view controller
        equipmentView.image = UIImage(named: eqName ?? " ")
        equipmentName.text = eqName ?? " "
        tipsView.image = UIImage(named: eqTips ?? " ")
        
        /// assigns avatar for the mascot read out button
        if let openerStr = userName {
            tipsReadOutImage.setBackgroundImage(UIImage(named: openerStr + "Tips" ), for: .normal)
        }

        // Do any additional setup after loading the view.
        /// removed the back text form the nevigation bar
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    /// reads out the sound of tips by mascot
    @IBAction func tipsReadOut(_ sender: Any) {
        
        let pathToSound = Bundle.main.path(forResource: eqTips, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pathToSound = Bundle.main.path(forResource: Constants.Sound.safetyTipsWelcomeMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
    }
    
    @IBAction func learnMoreVideoInstruction(_ sender: Any) {
        /// stops the intro sound
        audioPlayer?.stop()

        // navigate to video view controller
        let viewController = storyboard?.instantiateViewController(identifier: Constants.Identifier.youtubeInstructionVC) as! YoutubeInstructionViewController
        viewController.headerName = "\(eqName ?? " ") instruction video"
        viewController.youtubeVideoLink = eqVideo ?? " "
        navigationController?.pushViewController(viewController, animated: true)
    }
}
