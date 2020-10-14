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

class ThingsToCarryViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var thingsToCarryCollectionView: UICollectionView!
    
    let gradientLayer = CAGradientLayer()
    let APIKEY = "8ee001a3144d114f170986b983bd0f9c"
    var lat = 11.21231231
    var lon = 13.12121212
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()
    var thingsList: [ThingsCarry] = ThingsToCarryBank().list
    
    var arrSelectedIndex = [IndexPath]() // This is selected cell Index array
    var arrSelectedData = [ThingsCarry]() // This is selected cell data array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thingsToCarryCollectionView.dataSource = self
        thingsToCarryCollectionView.delegate = self

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
    
}

extension ThingsToCarryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thingsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thingsToCarryItems", for: indexPath) as! EachThingsCollectionViewCell
        
        if arrSelectedIndex.contains(indexPath) { // You need to check wether selected index array contain current index if yes then change the color
            
            // Correct should have the green background
            cell.itemImageView.backgroundColor = UIColor.green
            // wrong should have the red one
//            cell.itemImageView.backgroundColor = UIColor.red
            
            
        } else {
            cell.itemImageView.backgroundColor = .none
        }
        
        cell.itemImageView.image = UIImage(named: thingsList[indexPath.row].itemImage)
        cell.itemLabel.text = thingsList[indexPath.row].itemName
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
        //
        
        // code for new navigate to tips screen
        
        
        let strData = thingsList[indexPath.item]

        if arrSelectedIndex.contains(indexPath) {
            arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
            arrSelectedData = arrSelectedData.filter { $0 != strData}
        } else {
            arrSelectedIndex.append(indexPath)
            arrSelectedData.append(strData)
        }
        collectionView.reloadData()
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
}
