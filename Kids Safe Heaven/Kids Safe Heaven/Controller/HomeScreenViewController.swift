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
import AVFoundation
import CoreLocation

class HomeScreenViewController: UIViewController, DatabaseListener {
    
    @IBOutlet weak var openerAvater: UIImageView!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var locationAskButtonOutlet: UIButton!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    var audioPlayer: AVAudioPlayer?
    weak var databaseController: DatabaseProtocol?
    var listenerType: ListenerType = .all
    var user: User?
    var lat: Double?
    var lon: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        /// database and location delegate
        locationManager.delegate = self
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController

        guard let user = user else { return }

        let openerStr = (user.avatarName)! + "IntroHC"
        openerAvater.image = UIImage(named: openerStr)
    
        /// assigning and requesting for best accurate location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
        locationButton.isEnabled = false
        locationAskButtonOutlet.isHidden = false
        
        locationManager.startUpdatingLocation()
        
        /// when view controller appear again the navigation bar is hidden also
        self.navigationController?.navigationBar.isHidden = false


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        /// location update starts
        locationManager.startUpdatingLocation()

        /// playing introduction sound
        let pathToSound = Bundle.main.path(forResource: Constants.Sound.homeScreenWelcomeMessage, ofType: "wav")!
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
        /// stop updating location to reduce the battery use
        locationManager.stopUpdatingLocation()
        
        /// stop introduction sound when user goes to another screen
        audioPlayer?.stop()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.homeToSearchPark {
            let destination = segue.destination as! RecommendedParkHomeViewController
            destination.currentLocation = currentLocation
            destination.user = user
        } else if segue.identifier == Constants.Segue.homeToGame {
            let destination = segue.destination as! MainJourneyViewController
            destination.user = user
            destination.currentLocation = currentLocation
        }
    }
    @IBAction func locationAsksButton(_ sender: Any) {
        locationManager.requestWhenInUseAuthorization()
        createSettingsAlertController(title: "hi", message: "hello" )
    }
    func createSettingsAlertController(title: String, message: String) {

          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

          let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
          let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default) { (UIAlertAction) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)! as URL, options: [:], completionHandler: nil)
          }

          alertController.addAction(cancelAction)
          alertController.addAction(settingsAction)
          self.present(alertController, animated: true, completion: nil)

       }
    
    /// Database Delegate Methods
    /// do nothing
    func onUserScoreChange(change: DatabaseChange, userScore: [Score]) {}
    func onUserListChange(change: DatabaseChange, users: [User]) {}
}

extension HomeScreenViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location.coordinate
            if currentLocation?.latitude != 0 {
                locationButton.isEnabled = true
                locationAskButtonOutlet.isHidden = true
            }
        }
    }
    
    /// authorization change
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationServiceAvailableOrNot()
    }
    
    /// Checks authorization status and act accordingly
    func checkLocationServiceAvailableOrNot() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationButton.isEnabled = false
            locationAskButtonOutlet.isHidden = false
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            locationButton.isEnabled = false
            locationAskButtonOutlet.isHidden = false
            break
        case .denied:
            locationButton.isEnabled = false
            locationAskButtonOutlet.isHidden = false
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        @unknown default:
            break
        }
    }
}
