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
    
    var eqName: String?
    var eqTips: String?
    var introMessage: String = "intr"
    var userName: String?
    var user: User?

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipmentView.image = UIImage(named: eqName ?? " ")
        equipmentName.text = eqName ?? " "
        tipsView.image = UIImage(named: eqTips ?? " ")
        
        var openerStr = userName
        openerStr!.removeLast(5)
        openerStr?.append("Tips")
        tipsReadOutImage.setBackgroundImage(UIImage(named: openerStr ?? " "), for: .normal)
        
        
        // Do any additional setup after loading the view.
        /// removed the back text form the nevigation bar
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pathToSound = Bundle.main.path(forResource: introMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
        
    }
    
    @IBAction func learnMoreVideoInstruction(_ sender: Any) {
        // navigate to video view controller

    }
}
