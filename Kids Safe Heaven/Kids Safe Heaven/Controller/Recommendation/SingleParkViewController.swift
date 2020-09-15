//
//  SingleParkViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 15/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class SingleParkViewController: UIViewController {

    @IBOutlet weak var parkViewNameLabel: UILabel!
    @IBOutlet weak var parkViewImageView: UIImageView!
    @IBOutlet weak var equipmentCollectionView: UICollectionView!
    
    var currentEquipments: [String] = []
    var equipments: [String] = []
    var name: String?
    

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
    }

}

extension SingleParkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eachEquipmentCell", for: indexPath) as! ParkEquipmmentCollectionViewCell
        cell.parkEquipmentNameLabel.text = currentEquipments[indexPath.row]
        print("asdfasdf")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("0-----------asdfsadfasdfasdf-------------")
        print(currentEquipments.count)
        return currentEquipments.count
    }
    
    

}
