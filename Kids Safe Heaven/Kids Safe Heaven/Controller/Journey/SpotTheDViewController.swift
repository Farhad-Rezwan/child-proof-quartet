//
//  SpotTheDViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 7/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class SpotTheDViewController: UIViewController {
    @IBOutlet weak var spotTheDifferenceButtonHiddenUnlessPass: UIButton!
    @IBOutlet weak var spotTheDangerCollectionView: UICollectionView!
    
    @IBOutlet weak var brockenSlideSpottedImageView: UIImageView!
    @IBOutlet weak var brockenGlassSpottedImageView: UIImageView!
    @IBOutlet weak var sharpRockSpottedImageView: UIImageView!
    @IBOutlet weak var waterSprinklerSpottedImageView: UIImageView!
    @IBOutlet weak var waterPuddleSpottedImageView: UIImageView!
    @IBOutlet weak var holeInEquipmentImageView: UIImageView!
    @IBOutlet weak var brockenSwingSpottedImageView: UIImageView!
    
    @IBOutlet var spotTheDangerVisualEffect: UIVisualEffectView!
    @IBOutlet var spotTheDangerTipsView: UIView!
    
    var dangerItems: [Int] = [0,1,2,3,4,5,6]
    var hintShownFor: [Int] = []
    
    var hintImage: [UIImage] = []
    
    var globalImageView = UIImageView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        spotTheDangerCollectionView.dataSource = self
        spotTheDangerCollectionView.delegate = self
        
        hintImage = createImageArray(total: 8, imagePrefix: "hint")
        
        spotTheDangerTipsView.bounds = self.view.bounds
        spotTheDangerVisualEffect.bounds = self.view.bounds
        
        // unless all the objects are detected, the button for next screen wont appear
        spotTheDifferenceButtonHiddenUnlessPass.isHidden = true
        // making the back text in the back button dissappear
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //  Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    @IBAction func doneWithDangerIdentification(_ sender: Any) {
        nevigateToScoreBoardVC()
    }
    
    
    /// animate image tutorial
    /// https://www.youtube.com/watch?v=oe8kJYLR-qQ
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        globalImageView = imageView
        globalImageView.image = UIImage(named: "spotTheDHintChoosen")
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        // to animate 4 times put 4 here
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
        
    }

    func nevigateToScoreBoardVC() {
        let viewController = storyboard?.instantiateViewController(identifier: "journeyScoreboradVC") as! JourneyScoreboardViewController
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    
    @IBAction func spotTheDAction(_ sender: UIButton) {
        
        dangerItems.removeAll(where: { $0 == sender.tag })
        
        switch sender.tag {
        case 0:
            // tag 0 = brocken slide
            print("brocken slide seleted")
            brockenSlideSpottedImageView.image = UIImage(named: "spotTheDCorrectChoosen")
            break
        case 1:
            // tag 1 = brocken glass
            print("brocken glaas seleted")
            brockenGlassSpottedImageView.image = UIImage(named: "spotTheDCorrectChoosen")
            break
        case 2:
            // tag 2 = sharp rock
            print("sharp rock seleted")
            sharpRockSpottedImageView.image = UIImage(named: "spotTheDCorrectChoosen")
            break
        case 3:
            // tag 3 = water sprinklers
            print("water sprinklers seleted")
            waterSprinklerSpottedImageView.image = UIImage(named: "spotTheDCorrectChoosen")
            break
        case 4:
            // tag 4 = water puddle
            print("water puddle seleted")
            waterPuddleSpottedImageView.image = UIImage(named: "spotTheDCorrectChoosen")
            break
        case 5:
            // tag 5 = hole in equipment
            print("hile in equipment seleted")
            holeInEquipmentImageView.image = UIImage(named: "spotTheDCorrectChoosen")
            break
        default:
            // tag 6 = brocken swing
            print("brocken swing seleted")
            brockenSwingSpottedImageView.image = UIImage(named: "spotTheDCorrectChoosen")
            break
        }
        
        spotTheDangerVisualEffect.effect = UIBlurEffect(style: .light)
        spotTheDangerVisualEffect.backgroundColor = UIColor.init(red: 0.5, green: 0.0, blue: 0.0, alpha: 0.5)
        /// animates in depending on the selection of the user
        animateIn(desiredView: spotTheDangerVisualEffect)
        animateIn(desiredView: spotTheDangerTipsView)
        
        // once all selected is done
        if dangerItems == [] {
            print("allSelected")
            
        }

        spotTheDangerCollectionView.reloadData()
    }
    
    
    @IBAction func hintButtonPressed(_ sender: Any) {
        
        let randomUnselected = dangerItems.randomElement()
        
        guard randomUnselected != nil else {
            return
        }
        hintShownFor.append(randomUnselected!)
        print(hintShownFor)
        print(randomUnselected)
        print(dangerItems)
        
        if randomUnselected == 0 {
            // tag 0 = brocken slide
            animate(imageView: brockenSlideSpottedImageView, images: hintImage)

        } else if randomUnselected == 1 {
            // tag 1 = brocken glass
            animate(imageView: brockenGlassSpottedImageView, images: hintImage)
        } else if randomUnselected == 2 {
            // tag 2 = sharp rock
            animate(imageView: sharpRockSpottedImageView, images: hintImage)
            
        } else if randomUnselected == 3 {
            // tag 3 = water sprinklers
            animate(imageView: waterSprinklerSpottedImageView, images: hintImage)
            
        } else if randomUnselected == 4 {
            // tag 4 = water puddle
            animate(imageView: waterPuddleSpottedImageView, images: hintImage)
            
        } else if randomUnselected == 5 {
            // tag 5 = hole in equipment
            animate(imageView: holeInEquipmentImageView, images: hintImage)
            
        } else if randomUnselected == 6 {
            // tag 6 = brocken swing
            animate(imageView: brockenSwingSpottedImageView, images: hintImage)
            
        }
        
    }
    
    
    @IBAction func backToSpotDVC(_ sender: Any) {
        if dangerItems == [] {
            print("allSelected")
            navigationController?.popViewController(animated: true)
            return
        }
        
        animateOut(desiredView: spotTheDangerVisualEffect)
        animateOut(desiredView: spotTheDangerTipsView)
    }
    
    /// Animates uiView with a predefined duration of 0.3 sec
    /// - Parameter desiredView: desired image view
    func animateIn(desiredView: UIView) {
        let backgroundView = self.view!
        
        // attach our desired view to the screen (self?.view/backgroundView)
        backgroundView.addSubview(desiredView)
        
        // 20% bigger so looks like zooming out and in
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        // animate the effect
        UIView.animate(withDuration: 0.3, animations: {
            // after 0.3 sec this will happen
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    /// Animate outs uiView with a predefined duration of 0.3 sec
    /// - Parameter desiredView: desired image view
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
  
}


extension SpotTheDViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dangerItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemFoundCell", for: indexPath) as! ItemFoundCollectionViewCell
        cell.itemFoundImage.image = UIImage(named: "spotTheDCorrectChoosen")
        return cell
    }
    

    
}
