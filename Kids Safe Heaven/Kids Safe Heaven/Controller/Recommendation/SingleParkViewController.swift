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
    var introMessage = "selectYourFavouratePlayEquipment"
    var audioPlayer: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parkViewNameLabel.text = name
        
        currentEquipments = equipments
        equipmentCollectionView.dataSource = self
        equipmentCollectionView.delegate = self


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        equipmentCollectionView.reloadData()
        let backArrowImage = UIImage(named: "quizBack")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backIndicatorImage = renderedImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        
        
        
        // audio
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

}


extension SingleParkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eachEquipmentCell", for: indexPath) as! ParkEquipmmentCollectionViewCell
        cell.parkEquipmentNameLabel.text = currentEquipments[indexPath.row]
        cell.parkEquipmentImage.image = UIImage(named: currentEquipments[indexPath.row])
        print("the type is")
        print(getGroupForImage(equipmentName: currentEquipments[indexPath.row]))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentEquipments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: "safetyTipsViewController") as! SafetyTipsViewController
        viewController.eqName = currentEquipments[indexPath.row]
        viewController.eqTips = getGroupForImage(equipmentName: currentEquipments[indexPath.row])
        viewController.userName = userName
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func getGroupForImage(equipmentName: String) -> String {
        for item in equipmentsClass {
            if equipmentName == item.name {
                return item.group
            }
        }
        return " "
    }
    
    

}
