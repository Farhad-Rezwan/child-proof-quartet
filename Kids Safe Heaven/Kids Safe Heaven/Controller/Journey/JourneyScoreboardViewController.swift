//
//  JourneyScoreboardViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 14/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

class JourneyScoreboardViewController: UIViewController {

    @IBOutlet weak var journeySummaryTableView: UITableView!
    
    var audioPlayer: AVAudioPlayer?
    var thingsToCarryItems: [ThingsCarry] = []
    var dangerItems: [SpotTheDanger] = []
    var nextStageID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// defining delegates for table view
        journeySummaryTableView.dataSource = self
        journeySummaryTableView.delegate = self
    }
    
    /// navigates to Journey home
    @IBAction func navigateToHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
}

extension JourneyScoreboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// defines scoreboard depending of type of game played. First check dangerItem is null,
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dangerItems == [] {
            return thingsToCarryItems.count
        } else {
            return dangerItems.count
        }
    }
    
    /// defining the cell, to make it reusable, checks whether the danger item is nill or not, if nill, shows things to carry item pupulating the corresponding cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thingsToCarryTVC", for: indexPath)
        if dangerItems == [] {
            cell.textLabel?.text = thingsToCarryItems[indexPath.row].itemName
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.highlightedTextColor = .black
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            let itemImageName = thingsToCarryItems[indexPath.row].itemImage
            cell.imageView?.image = UIImage(named: itemImageName)
        } else {
            cell.textLabel?.text = dangerItems[indexPath.row].dangerName
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.highlightedTextColor = .black
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            let itemImageName = dangerItems[indexPath.row].dangerImage
            cell.imageView?.image = UIImage(named: itemImageName)
        }
        return cell
    }
    
    /// when user selects any of the cell, he can hear the corresponding tips
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /// stops the sounds when user clicks too quickly
        audioPlayer?.stop()
        
        var soundString = ""
        
        /// depending on type of game user has played sound is populated
        if dangerItems == [] {
            soundString = thingsToCarryItems[indexPath.row].itemSafetyTips
        } else {
            soundString = dangerItems[indexPath.row].dangerTips
        }

        /// tip sound
        let pathToSound = Bundle.main.path(forResource: soundString, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
    }
    
}
