//
//  ThingsToCarryViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 7/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import Foundation
import AVFoundation
import CoreLocation

class ThingsToCarryViewController: UIViewController {
    
    @IBOutlet var tipsView: UIView!
    @IBOutlet var visualAffectView: UIVisualEffectView!
    @IBOutlet weak var mascotImageToBeHiddenIfPass: UIImageView!
    @IBOutlet weak var buttonToBeHiddenUnlessPass: UIButton!
    @IBOutlet weak var thingsToCarryCollectionView: UICollectionView!
    @IBOutlet weak var tipsImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer?
    let gradientLayer = CAGradientLayer()
    let APIKEY = "8ee001a3144d114f170986b983bd0f9c"
    var activityIndicator: NVActivityIndicatorView!
    var thingsListShuffeled: [ThingsCarry] = []
    var user: User?
    var arrSelectedIndex = [IndexPath]() // This is selected cell Index array
    var arrSelectedData = [ThingsCarry]() // This is selected cell data array
    var currentLocation: CLLocationCoordinate2D?
    weak var databaseController: DatabaseProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// adding delegates
        thingsToCarryCollectionView.dataSource = self
        thingsToCarryCollectionView.delegate = self
        
        /// Database delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        
        
        /// adding boundary to tips view and visual affect view
        tipsView.bounds = self.view.bounds
        visualAffectView.bounds = self.view.bounds
        
        countLabel.text = "You have selected 0 out of 5 correct items"

        // making button hidden unless 5 items are selected // quizNextButtonBlack // quizNextButtonBlack // quizNextButtonForHere
        let origImage = UIImage(named: "quizNextButtonBlack")
        buttonToBeHiddenUnlessPass.setBackgroundImage(origImage, for: .normal)

        /// temp image for avatar
        if let tempAvatarShow : String = user?.avatarName {
            mascotImageToBeHiddenIfPass.image = UIImage(named: tempAvatarShow + "Cold")
        }
        
        // indicator for loading the weather
        let indicatorSize: CGFloat = 70
        let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize)
        activityIndicator = NVActivityIndicatorView(frame: indicatorFrame,type: .lineScale, color: UIColor.white, padding: 20.0)
        activityIndicator.backgroundColor = UIColor.black
        view.addSubview(activityIndicator)
        
        ifWeatherEnabledRequestBackend()
        
    }
    
    /// checks if the whether is enabled or not, if enabled than fetches particular weather from backend
    func ifWeatherEnabledRequestBackend() {
        if currentLocation?.latitude != nil && currentLocation?.latitude != 0 {
            activityIndicator.startAnimating()
            requestWeatherApi()
        } else {
            showPopUpToMakeUserChoose()
        }
    }
    
    func showPopUpToMakeUserChoose() {
        let weatherDependentAvatar: String = user?.avatarName ?? "zac"
        /// alert
        let alert = UIAlertController(title: "Location service is disabled", message: "You can choose any of the suitable weather type", preferredStyle: .alert)
        
        /// setting allart with restart and done action
        let coldAction = UIAlertAction(title: "Winter", style: .default) { (action) in
            print("cold")
            self.loadSelection(type: "winter")
            self.mascotImageToBeHiddenIfPass.image = UIImage(named: weatherDependentAvatar + "Cold")
        }
        alert.addAction(coldAction)
        let norAction = UIAlertAction(title: "Normal", style: .default) { (action) in
            print("normal")
            self.loadSelection(type: "normal")
            self.mascotImageToBeHiddenIfPass.image = UIImage(named: weatherDependentAvatar + "Nor")
        }
        alert.addAction(norAction)
        let summerAction = UIAlertAction(title: "Summer", style: .default) { (action) in
            print("summer")
            self.loadSelection(type: "summer")
            self.mascotImageToBeHiddenIfPass.image = UIImage(named: weatherDependentAvatar + "Hot")
        }
        alert.addAction(summerAction)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        /// present the alert
        present(alert, animated: true, completion: nil)
    }
    
    func loadSelection(type: String) {
        print("loading \(type) weather")
        let thingsList: [ThingsCarry] = ThingsToCarryBank(type: type).list
        thingsListShuffeled = thingsList.shuffled()
        thingsToCarryCollectionView.reloadData()
        
    }
    
    func requestWeatherApi() {
        if let lat: Double = currentLocation?.latitude, let lon: Double = currentLocation?.longitude {
            Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(APIKEY)&units=metric").responseJSON { [self] (response) in
                if let responseStr = response.result.value {
                    let jsonResponse = JSON(responseStr)
                    let jsonWeather = jsonResponse["weather"].array![0]
                    let jsonTemp = jsonResponse["main"]

                    let weatherDependentAvatar: String = user?.avatarName ?? "zac"

                    let condition = jsonWeather["main"].stringValue
                    let tempDegree = Int(round(jsonTemp["temp"].doubleValue))
                        
                    print(tempDegree)
                    if condition == "Rainy" {
                        
                    } else {
                        switch tempDegree {
                        case ...15 :
                            print("cold")
                            self.loadSelection(type: "winter")
                            self.mascotImageToBeHiddenIfPass.image = UIImage(named: weatherDependentAvatar + "Cold")
                            break
                        case 16...24 :
                            print("normal")
                            self.loadSelection(type: "normal")
                            self.mascotImageToBeHiddenIfPass.image = UIImage(named: weatherDependentAvatar + "Nor")
                            break
                        case 25... :
                            print("summer")
                            self.loadSelection(type: "summer")
                            self.mascotImageToBeHiddenIfPass.image = UIImage(named: weatherDependentAvatar + "Hot")
                            break
                        default:
                            self.loadSelection(type: "summer")
                            self.mascotImageToBeHiddenIfPass.image = UIImage(named: weatherDependentAvatar + "Hot")
                            break
                            
                        }
                    }
                    activityIndicator.stopAnimating()
                }
            }
        }

    }


    @IBAction func nextStageButton(_ sender: Any) {
        /// wont nevigate to next stage as per IM feedback
        //nevigateToNewStage()
        if !arrayHas5CorrectAnswer() {
            let alert = UIAlertController(title: "Awesome", message: "Do you want to close the game?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "YES", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            let no = UIAlertAction(title: "NO", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(yes)
            alert.addAction(no)
            present(alert, animated: true, completion: nil)
        } else {
            user?.thingsDone = true
            databaseController?.cleanup()
            nevigateToNewStage()
        }
    }
    
    func nevigateToNewStage() {
        let viewController = storyboard?.instantiateViewController(identifier: Constants.Identifier.journeyScooreBoardVC) as! JourneyScoreboardViewController
        var onlyCorrect: [ThingsCarry] = []
        
        for i in self.thingsListShuffeled {
            if i.itemValidity {
                onlyCorrect.append(i)
            }
        }
        viewController.thingsToCarryItems.append(contentsOf: onlyCorrect)
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    
    
    @IBAction func tipsReadDone(_ sender: Any) {
        animateOut(desiredView: visualAffectView)
        animateOut(desiredView: tipsView)
        audioPlayer?.stop()
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
    
    
    func setImageForTipView(element: ThingsCarry){
        // tips view design here
        tipsImageView.image = UIImage(named: element.itemSafetyTips)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ThingsToCarryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    /// number of things to carry item right and wrong = 9
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thingsListShuffeled.count
    }
    
    /// defining each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thingsToCarryItems", for: indexPath) as! EachThingsCollectionViewCell
        
        /// You need to check wether selected index array contain current index if yes then change the color
        if arrSelectedIndex.contains(indexPath) {
            let data = thingsListShuffeled[indexPath.item]

            if data.itemValidity {
                // Correct should have the green background
                cell.itemImageView.backgroundColor = UIColor.green
            } else {
                // wrong should have the red one
                cell.itemImageView.backgroundColor = UIColor.red
            }
        } else {
            // wighout any backgound color for cell
            cell.itemImageView.backgroundColor = .none
        }

        /// defining other assets.
        cell.itemImageView.image = UIImage(named: thingsListShuffeled[indexPath.row].itemImage)
        cell.itemImageView.layer.cornerRadius = 20
        cell.itemLabel.text = thingsListShuffeled[indexPath.row].itemName
        return cell
    }
    
    
    /// defining the size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    /// adding mergins = zero
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    /// spacing between item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    /// spacing between rows or collumns
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /// when user selects any of the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let strData = thingsListShuffeled[indexPath.item]
        
        // sets image for tips view
        setImageForTipView(element: strData)
        
        if arrSelectedIndex.contains(indexPath) {
            arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
            arrSelectedData = arrSelectedData.filter { $0 != strData}
        } else {
            arrSelectedIndex.append(indexPath)
            arrSelectedData.append(strData)
        }
        
        if strData.itemSelected {
            strData.itemSelected = false
            /// reloads the data afther the selection is done, helps to make selected things appear green or red
            collectionView.reloadData()
        } else {

            visualAffectView.effect = UIBlurEffect(style: .light)
                
            /// if the option is correct the blur view will be green or the blur view will become red
            if strData.itemValidity {
                visualAffectView.backgroundColor = UIColor.init(red: 0.0, green: 0.5, blue: 0.0, alpha: 0.3)
                
                // can do sound effect for the right and wrong here
                print("correct")
            } else {
                visualAffectView.backgroundColor = UIColor.init(red: 0.5, green: 0.0, blue: 0.0, alpha: 0.3)
                
            }
            
            /// animates in depending on the selection of the user
            animateIn(desiredView: visualAffectView)
            animateIn(desiredView: tipsView)
            
            /// reloads the data afther the selection is done, helps to make selected things appear green or red
            collectionView.reloadData()
            strData.itemSelected = true
            
            /// tip sound
            let pathToSound = Bundle.main.path(forResource: strData.itemSafetyTips, ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer!.play()
            } catch {
                print("error playing")
            }
            
            
        }
        if arrayHas5CorrectAnswer() {
            let origImage = UIImage(named: "quizNextButtonForHere")
            buttonToBeHiddenUnlessPass.setBackgroundImage(origImage, for: .normal)
        } else {
            let origImage = UIImage(named: "quizNextButtonBlack")
            buttonToBeHiddenUnlessPass.setBackgroundImage(origImage, for: .normal)
        }
    }
    
    /// Checks whether all the correct answer is clicked or not
    /// - Returns: returns the boolean value for all correct answer is selected or not
    func arrayHas5CorrectAnswer() -> Bool {
        var has5Correct = false
        var count = 0
        for i in arrSelectedData {
            if i.itemValidity {
                count = count + 1
            }
        }
        
        if count == 5 {
            countLabel.text = "You have correctly selected all items, Press next to see summary"
            has5Correct = true
        } else {
            countLabel.text = "You have selected " + String(count) + " out of 5 correct items"
        }
        
        return has5Correct
    }
}
