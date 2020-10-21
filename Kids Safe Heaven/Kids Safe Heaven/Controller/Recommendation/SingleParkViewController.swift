//
//  SingleParkViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 15/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

class SingleParkViewController: UIViewController {

    @IBOutlet weak var parkViewNameLabel: UILabel!
    @IBOutlet weak var parkViewImageView: UIImageView!
    @IBOutlet weak var equipmentCollectionView: UICollectionView!
    
    
    var currentEquipments: [String] = []
    var equipments: [String] = []
    var name: String?
    var equipmentsClass: [Equipment] = EquipmentBank().list
    var userName: String?
    var introMessage = Constants.Sound.singleParkWelcomeMessage
    var audioPlayer: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// assigning delegates
        equipmentCollectionView.dataSource = self
        equipmentCollectionView.delegate = self
        
        /// decorating the view for user
        parkViewNameLabel.text = name
        
        /// current equipments to show
        currentEquipments = equipments
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // audio message to welcome user and asks for choosing a equipment
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
        
        /// stops the player when user moves to another screen
        audioPlayer?.stop()
    }

}


extension SingleParkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    /// populates and designs each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.eachEquipmentCell, for: indexPath) as! ParkEquipmmentCollectionViewCell
        cell.parkEquipmentNameLabel.text = currentEquipments[indexPath.row]
        cell.parkEquipmentImage.image = UIImage(named: currentEquipments[indexPath.row])
        print(getGroupForImage(equipmentName: currentEquipments[indexPath.row]))
        
        return cell
    }
    
    /// determines number of equipments to show
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentEquipments.count
    }
    
    /// handles when user selects any of the equipment
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: Constants.Identifier.safetyTipsVC) as! SafetyTipsViewController
        viewController.eqName = currentEquipments[indexPath.row]
        viewController.eqTips = getGroupForImage(equipmentName: currentEquipments[indexPath.row])
        viewController.userName = userName
        viewController.eqVideo = getVideoLinkForYPl(equipmentName: currentEquipments[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /// Finds out the equipment safety tips group image
    /// - Parameter equipmentName: takes equipment name as parameter
    /// - Returns: returns equipment safety tips group image
    func getGroupForImage(equipmentName: String) -> String {
        for item in equipmentsClass {
            if equipmentName == item.name {
                return item.group
            }
        }
        return " "
    }
    
    /// Method to get equipment youtube video link
    /// - Parameter equipmentName: takes equipment name as parameter
    /// - Returns: returns equipment safety tips video
    func getVideoLinkForYPl(equipmentName: String) -> String {
        for item in equipmentsClass {
            if equipmentName == item.name {
                return item.instrVideoLink
            }
        }
        return " "
    }
}
