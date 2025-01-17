//
//  SpotTheDViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 7/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import AVFoundation

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
    @IBOutlet weak var spotTheDTipsMascot: UIButton!
    @IBOutlet weak var dangerTipImageView: UIImageView!

    var dangerItems: [Int] = [0,1,2,3,4,5,6]
    var hintShownFor: [Int] = []
    var hintImage: [UIImage] = []
    var globalImageView = UIImageView()
    var audioPlayer: AVAudioPlayer?
    var user: User?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// assigning delegates
        spotTheDangerCollectionView.dataSource = self
        spotTheDangerCollectionView.delegate = self
        /// defining boundary for the Tips View and Visual Effect view
        spotTheDangerTipsView.bounds = self.view.bounds
        spotTheDangerVisualEffect.bounds = self.view.bounds
        spotTheDTipsMascot.setBackgroundImage(UIImage(named: user?.avatarName ?? "zac"), for: .normal)
        

        /// hint image animation load
        hintImage = createImageArray(total: 8, imagePrefix: "hint")

        // unless all the objects are detected, the button for next screen wont appear
        spotTheDifferenceButtonHiddenUnlessPass.isHidden = true
    }

    /// https://www.youtube.com/watch?v=oe8kJYLR-qQ
    ///  helps to return collection of UIImage so that those can be use to animate
    /// - Parameters:
    ///   - total: total number of image to add
    ///   - imagePrefix: prefix of the image.
    /// - Returns: returns collection of UIImages
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
    
    /// animate the image view
    /// - Parameters:
    ///   - imageView: Image view to animate
    ///   - images: Collection of images
    func animate(imageView: UIImageView, images: [UIImage]) {
        globalImageView = imageView
        globalImageView.image = UIImage(named: "spotTheDHintChoosen")
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        // to animate 4 times put 4 here
        imageView.animationRepeatCount = 1
        imageView.startAnimating()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func spotTheDAction(_ sender: UIButton) {
        /// stops audio player of hint once user selects any of the correct object
        audioPlayer?.stop()
        
        let dangItem: SpotTheDanger = SpotTheDangerBank.init().list[sender.tag]
        let correctIcon = Constants.Design.spotTheDangerCorrectIcon
        
        dangerItems.removeAll(where: { $0 == sender.tag })
        
        switch sender.tag {
        case 0:
            // tag 0 = brocken slide
            print("brocken slide seleted")
            brockenSlideSpottedImageView.image = UIImage(named: correctIcon)
            break
        case 1:
            // tag 1 = brocken glass
            print("brocken glaas seleted")
            brockenGlassSpottedImageView.image = UIImage(named: correctIcon)
            break
        case 2:
            // tag 2 = sharp rock
            print("sharp rock seleted")
            sharpRockSpottedImageView.image = UIImage(named: correctIcon)
            break
        case 3:
            // tag 3 = water sprinklers
            print("water sprinklers seleted")
            waterSprinklerSpottedImageView.image = UIImage(named: correctIcon)
            break
        case 4:
            // tag 4 = water puddle
            print("water puddle seleted")
            waterPuddleSpottedImageView.image = UIImage(named: correctIcon)
            break
        case 5:
            // tag 5 = hole in equipment
            print("hile in equipment seleted")
            holeInEquipmentImageView.image = UIImage(named: correctIcon)
            break
        default:
            // tag 6 = brocken swing
            print("brocken swing seleted")
            brockenSwingSpottedImageView.image = UIImage(named: correctIcon)
            break
        }

        /// play danger tips sound
        let pathToSound = Bundle.main.path(forResource: dangItem.dangerTips, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
        
        dangerTipImageView.image = UIImage(named: dangItem.dangerImage + "_")
        
        /// animates in depending on the selection of the user
        spotTheDangerVisualEffect.effect = UIBlurEffect(style: .light)
        spotTheDangerVisualEffect.backgroundColor = UIColor.init(red: 0.0, green: 0.5, blue: 0.0, alpha: 0.5)
        animateIn(desiredView: spotTheDangerVisualEffect)
        animateIn(desiredView: spotTheDangerTipsView)
        
        // reloads data
        spotTheDangerCollectionView.reloadData()
    }
    

    @IBAction func hintButtonPressed(_ sender: Any) {
        /// if hint button is pressed twice helps to reduce the redundency of sound
        audioPlayer?.stop()
        /// plays hint sound
        playHintSound()
        
        let randomUnselected = dangerItems.randomElement()
        /// makes sure that random element is not nill
        guard randomUnselected != nil else {
            return
        }
        
        /// if the random unselected is not nill
        hintShownFor.append(randomUnselected!)
        // play hint sound

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
    
    /// Plays hint sound
    func playHintSound() {
        let pathToSound = Bundle.main.path(forResource: Constants.Sound.hintButtonSound, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
    }

    /// button to get back from the tips view
    @IBAction func backToSpotDVC(_ sender: Any) {
        audioPlayer?.stop()
        if dangerItems == [] {
            print("allSelected")
            /// if there is not quiz question left
            let alert = UIAlertController(title: "Awesome", message: "You have correctly selected all items, Press next to see summary", preferredStyle: .alert)

            /// setting allart with restart and done action
            let restartAction = UIAlertAction(title: "Play Again", style: .default) { [self] (action) in
                self.animateOut(desiredView: self.spotTheDangerVisualEffect)
                self.animateOut(desiredView: self.spotTheDangerTipsView)
                self.restartsTheSpotTheD()
            }
            alert.addAction(restartAction)
            let anotherAction = UIAlertAction(title: "Next", style: .default) { (action) in
                self.nevigateToScoreBoardVC()
            }
            alert.addAction(anotherAction)
            
            /// present the alert
            present(alert, animated: true, completion: nil)
            return
        }
        
        /// animate out the tips view and visual effect view
        animateOut(desiredView: spotTheDangerVisualEffect)
        animateOut(desiredView: spotTheDangerTipsView)
    }
    
    /// helps to navigate to score board view controller
    func nevigateToScoreBoardVC() {
        let viewController = storyboard?.instantiateViewController(identifier: Constants.Identifier.journeyScooreBoardVC) as! JourneyScoreboardViewController
        
        viewController.dangerItems.append(contentsOf: SpotTheDangerBank.init().list)
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    /// Restarts the game as user choosen to play agin
    func restartsTheSpotTheD() {
        dangerItems = [0,1,2,3,4,5,6]
        spotTheDangerCollectionView.reloadData()
        hintShownFor = []
        
        brockenSlideSpottedImageView.image = nil
        brockenGlassSpottedImageView.image = nil
        sharpRockSpottedImageView.image = nil
        waterSprinklerSpottedImageView.image = nil
        waterPuddleSpottedImageView.image = nil
        holeInEquipmentImageView.image = nil
        brockenSwingSpottedImageView.image = nil

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
    
    /// helps to show the number of "!" icon at the top, depecting how many item user needs to choose
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dangerItems.count
    }
    
    /// difining the cell for number of item user need to choose, Shows "!"
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.itemFoundCollVC, for: indexPath) as! ItemFoundCollectionViewCell
        cell.itemFoundImage.image = UIImage(named: Constants.Design.spotTheDangerCorrectIcon + "_")
        return cell
    }
}
