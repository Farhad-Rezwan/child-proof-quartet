//
//  HomeScreenViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 30/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation
import Foundation

class HomeScreenViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tipsLabel: UILabel!
    
    let gradientLayer = CAGradientLayer()
    let APIKEY = "8ee001a3144d114f170986b983bd0f9c"
    var lat = 11.21231231
    var lon = 13.12121212
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.addSublayer(gradientLayer)
        
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
                let jsonTemp = jsonResponse["main"]
                let iconName = jsonWeather["icon"].stringValue
                
                
                
                self.locationLabel.text = jsonResponse["name"].stringValue
                self.conditionImageView.image = UIImage(named: iconName)
                let condition = jsonWeather["main"].stringValue
                self.conditionLabel.text = condition
                self.temperatureLabel.text = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEE"
                self.dayLabel.text = dateFormatter.string(for: date)
                
                
                let suffix = iconName.suffix(1)
                if suffix == "n" {
                    self.setGrayGradientBackground()
                    self.tipsLabel.text = "Its night time"
                } else {
                    self.setBlueGradientBackground()
                    var tips: [String] = []
                    if condition == "Clouds" {
                        tips.append(contentsOf:
                        ["Check for obvious signs of damage or decay, such as loose or broken nuts and bolts or rotting wood in equipment, gates, and fences. Check painted surfaces for chipping paint that would need a coat of primer. Check for holes in fences. ", "Check the swings for proper height and stability; make sure the ropes are properly attached and not frayed. Check the slides to make sure the protective surfaces around them have enough sand or mulch. Be sure to clean off bird droppings. ", "Check for natural hazards: Fallen tree limbs and branches are obvious, but also make sure there aren’t any damaged limbs that could fall into the playground. Water erosion can expose rocks and other objects that may be dangerous for children, and burrowing animals can leave behind dangerous holes. Finally, insects may build new nests where there were none before.", "Check for human pollution: bottles, cans, and pieces of glass.", "Check the sandbox: Make sure it’s clean and free of debris, such as twigs and glass; also make sure it hasn’t been used by cats as a litter box!"] )
                        self.tipsLabel.text = tips.randomElement()
                    } else if condition == "Clear" {
                        tips.append(contentsOf: ["The sky is clear, enjoy your good time in play park"] )
                        self.tipsLabel.text = tips.randomElement()
                        
                    } else if condition == "Windy" {
                        tips.append(contentsOf: ["Weather is not suitable better to stay home"] )
                        self.tipsLabel.text = tips.randomElement()
                    } else if condition == "Rainy" {
                        tips.append(contentsOf: ["It is raining and is not suitable to play outside better to stay home"] )
                        self.tipsLabel.text = tips.randomElement()
                        
                    } else {
                        tips.append(contentsOf: ["Check for obvious signs of damage or decay, such as loose or broken nuts and bolts or rotting wood in equipment, gates, and fences. Check painted surfaces for chipping paint that would need a coat of primer. Check for holes in fences. ", "Check the swings for proper height and stability; make sure the ropes are properly attached and not frayed. Check the slides to make sure the protective surfaces around them have enough sand or mulch. Be sure to clean off bird droppings. ", "Check for natural hazards: Fallen tree limbs and branches are obvious, but also make sure there aren’t any damaged limbs that could fall into the playground. Water erosion can expose rocks and other objects that may be dangerous for children, and burrowing animals can leave behind dangerous holes. Finally, insects may build new nests where there were none before.", "Check for human pollution: bottles, cans, and pieces of glass.", "Check the sandbox: Make sure it’s clean and free of debris, such as twigs and glass; also make sure it hasn’t been used by cats as a litter box!"] )
                        self.tipsLabel.text = tips.randomElement()
                        
                    }
                }
            }
        }
        self.locationManager.stopUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setBlueGradientBackground()
//        setGrayGradientBackground()
    }
    
    func setBlueGradientBackground() {
        let topColor = UIColor(red: 95.0/255.0, green: 165.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 114.0/255.0, blue: 184.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
        
    }
    func setGrayGradientBackground() {
        let topColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 72.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
        
    }
}
