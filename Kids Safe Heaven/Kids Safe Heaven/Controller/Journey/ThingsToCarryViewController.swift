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
import CoreLocation
import Foundation
import AVFoundation

class ThingsToCarryViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var tipsView: UIView!
    @IBOutlet var visualAffectView: UIVisualEffectView!
    @IBOutlet weak var thingsToCarryCollectionView: UICollectionView!
    
    var audioPlayer: AVAudioPlayer?
    let gradientLayer = CAGradientLayer()
    let APIKEY = "8ee001a3144d114f170986b983bd0f9c"
    var lat = 11.21231231
    var lon = 13.12121212
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()
    var thingsListShuffeled: [ThingsCarry] = []
    var thingsList: [ThingsCarry] = ThingsToCarryBank().list
    
    var arrSelectedIndex = [IndexPath]() // This is selected cell Index array
    var arrSelectedData = [ThingsCarry]() // This is selected cell data array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thingsListShuffeled = thingsList.shuffled()
        thingsToCarryCollectionView.dataSource = self
        thingsToCarryCollectionView.delegate = self
        tipsView.bounds = self.view.bounds
        visualAffectView.bounds = self.view.bounds

            let indicatorSize: CGFloat = 70
            let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize)
            activityIndicator = NVActivityIndicatorView(frame: indicatorFrame,type: .lineScale, color: UIColor.white, padding: 20.0)
            activityIndicator.backgroundColor = UIColor.black
            view.addSubview(activityIndicator)
            
    //        activityIndicator.startAnimating()
            locationManager.requestWhenInUseAuthorization()
            
            activityIndicator.startAnimating()
            
            if(CLLocationManager.locationServicesEnabled()) {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }
    
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        lat = location.coordinate.latitude
        lon = location.coordinate.longitude
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(APIKEY)&units=metric").responseJSON { (response) in
        self.activityIndicator.stopAnimating()
        if let responseStr = response.result.value {
            let jsonResponse = JSON(responseStr)
            let jsonWeather = jsonResponse["weather"].array![0]
            let weatherType = jsonWeather["main"].stringValue
//            self.weatherType.text = weatherType
            }
        self.locationManager.stopUpdatingLocation()
        }
    }
    @IBAction func tipsReadDone(_ sender: Any) {
        animateOut(desiredView: visualAffectView)
        animateOut(desiredView: tipsView)
    }
    
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
        
        
    }
    
    
    
}

extension ThingsToCarryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thingsListShuffeled.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thingsToCarryItems", for: indexPath) as! EachThingsCollectionViewCell
        
        if arrSelectedIndex.contains(indexPath) {
            // You need to check wether selected index array contain current index if yes then change the color
            let data = thingsListShuffeled[indexPath.item]

            if data.itemValidity {
                // Correct should have the green background
                cell.itemImageView.backgroundColor = UIColor.green
            } else {
                // wrong should have the red one
                cell.itemImageView.backgroundColor = UIColor.red
            }
        } else {
            cell.itemImageView.backgroundColor = .none
        }
        
        cell.itemImageView.image = UIImage(named: thingsListShuffeled[indexPath.row].itemImage)
        cell.itemImageView.layer.cornerRadius = 20
        cell.itemLabel.text = thingsListShuffeled[indexPath.row].itemName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
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

            visualAffectView.effect = UIBlurEffect(style: .dark)
                
            /// if the option is correct the blur view will be green or the blur view will become red
            if strData.itemValidity {
                visualAffectView.backgroundColor = UIColor.init(red: 0.0, green: 0.5, blue: 0.0, alpha: 0.5)
                
                // can do sound effect for the right and wrong here
                print("correct")
                let pathToSound = Bundle.main.path(forResource: "correct", ofType: "mp3")!
                let url = URL(fileURLWithPath: pathToSound)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer!.play()
                } catch {
                    print("error playing")
                }
            } else {
                visualAffectView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.0, alpha: 0.5)
                
                // can do sound effect for the right and wrong here
                print("wrong")
                let pathToSound = Bundle.main.path(forResource: "wrong", ofType: "mp3")!
                let url = URL(fileURLWithPath: pathToSound)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer!.play()
                } catch {
                    print("error playing")
                }
            }
            
            /// animates in depending on the selection of the user
            animateIn(desiredView: visualAffectView)
            animateIn(desiredView: tipsView)
            
            /// reloads the data afther the selection is done, helps to make selected things appear green or red
            collectionView.reloadData()
            strData.itemSelected = true
            
        }
    }
}
