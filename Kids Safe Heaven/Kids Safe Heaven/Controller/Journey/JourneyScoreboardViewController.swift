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

    var audioPlayer: AVAudioPlayer?
    @IBOutlet weak var journeySummaryTableView: UITableView!
    var thingsToCarryItems: [ThingsCarry] = []
    var dangerItems: [SpotTheDanger] = []
    var nextStageID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        journeySummaryTableView.dataSource = self
        journeySummaryTableView.delegate = self
    }
    
    @IBAction func navigateToHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension JourneyScoreboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dangerItems == [] {
            return thingsToCarryItems.count
        } else {
            return dangerItems.count
        }
    }
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        audioPlayer?.stop()
        var soundString = ""
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
