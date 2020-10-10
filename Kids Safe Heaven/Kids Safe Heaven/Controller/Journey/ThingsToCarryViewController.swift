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
    
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var thingsToCarryCollectionView: UICollectionView!
    
    let gradientLayer = CAGradientLayer()
    let APIKEY = "8ee001a3144d114f170986b983bd0f9c"
    var lat = 11.21231231
    var lon = 13.12121212
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()
    var thingsList: [ThingsCarry] = ThingsToCarryBank().list
    
    
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
            self.weatherType.text = weatherType
            }
        self.locationManager.stopUpdatingLocation()
        }
    }
    
}

extension ThingsToCarryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thingsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thingsToCarryItems", for: indexPath) as! EachThingsCollectionViewCell
        cell.itemImageView.image = UIImage(named: thingsList[indexPath.row].itemImage)
        cell.itemLabel.text = thingsList[indexPath.row].itemName
        return cell
    }
}
