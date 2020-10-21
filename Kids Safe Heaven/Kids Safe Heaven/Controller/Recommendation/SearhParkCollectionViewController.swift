//
//  SearhParkCollectionViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 13/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation

class SearhParkCollectionViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var playParksCollectionView: UICollectionView!
    @IBOutlet weak var mySegment: UISegmentedControl!

    let parkImageArray = [#imageLiteral(resourceName: "park1Button"),#imageLiteral(resourceName: "park2Button"),#imageLiteral(resourceName: "park3Button"),#imageLiteral(resourceName: "park4Button"),#imageLiteral(resourceName: "park5Button")]
    var parkNumberingArray: [UIImage]? = [#imageLiteral(resourceName: "one"),#imageLiteral(resourceName: "two"),#imageLiteral(resourceName: "three"),#imageLiteral(resourceName: "four"),#imageLiteral(resourceName: "five")]
    var userName: String?
    var audioPlayer: AVAudioPlayer?
    var allParks: [Park] = []
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    var parkManager = ParkManager()
    var introMessage = Constants.Sound.searchLocationWelcomeMessage
    var stringReqURL = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// assigning delegates
        locationManager.delegate = self
        playParksCollectionView.delegate = self
        playParksCollectionView.dataSource = self
        
        /// defining desired accuracy to best
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10

        // removng the back text form the navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// location update starts
        locationManager.startUpdatingLocation()
        
        // making the navigation bar appear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
        
        /// stops player when user moves to different screen
        audioPlayer?.stop()
    }
    

    // MARK: - CLLocation Manager Delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location.coordinate
        }
        
        if let lat = currentLocation?.latitude, let lon = currentLocation?.longitude {
            stringReqURL = "lat=\(lat)&lon=\(lon)"
            allParks.removeAll()
            if allParks.count == 0 {
                switch mySegment.selectedSegmentIndex {
                    case 0:
                        let park: [Park] = parkManager.fetchPark(urlLastPortion: stringReqURL)
                        allParks.append(contentsOf: park)
                        print("first segment loaded")
                        break
                    case 1:
                        let unsorted: [Park] = parkManager.fetchPark(urlLastPortion: stringReqURL)
                        let sorted = unsorted.sorted(by: {$0.ranking > $1.ranking})
                        print(sorted)
                        allParks.append(contentsOf: sorted)
                        print("second segment loaded")
                        break
                    default:
                        let park: [Park] = parkManager.fetchPark(urlLastPortion: stringReqURL)
                        allParks.append(contentsOf: park)
                        print("default first segment loaded")
                        break;
                }
            }
            playParksCollectionView.reloadData()
            // reload data
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
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            populateParksSound()
            break
        case .authorizedWhenInUse:
            populateParksSound()
            break
        @unknown default:
            break
        }
    }
    
    /// Welcome sound when user visit this view controller
    func populateParksSound() {
        let pathToSound = Bundle.main.path(forResource: introMessage, ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("error playing")
        }
    }
    
    /// Controlls user selection
    /// - Parameter sender: Segment Control
    @IBAction func segmentControll(_ sender: UISegmentedControl) {
        switch mySegment.selectedSegmentIndex{
                case 0:
                    let park: [Park] = parkManager.fetchPark(urlLastPortion: stringReqURL)
                    allParks.removeAll()
                    allParks.append(contentsOf: park)
                    playParksCollectionView.reloadData()
                    print("first segment loaded")
                    break
                case 1:
                    let unsorted: [Park] = parkManager.fetchPark(urlLastPortion: stringReqURL)
                    let sorted = unsorted.sorted(by: {$0.ranking > $1.ranking})
                    print(sorted)
                    allParks.removeAll()
                    allParks.append(contentsOf: sorted)
                    playParksCollectionView.reloadData()
                    print("second segment loaded")
                    break
                default:
                    let park: [Park] = parkManager.fetchPark(urlLastPortion: stringReqURL)
                    allParks.removeAll()
                    allParks.append(contentsOf: park)
                    playParksCollectionView.reloadData()
                    print("first segment loaded")
                    break;
            }
        print(stringReqURL)
    }
}

extension SearhParkCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    /// handle number of park to show, here always will be 5
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allParks.count
    }
    
    /// populate park data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eachParkCell", for: indexPath) as! ParkDataCollectionViewCell
        
        cell.parkName.text = allParks[indexPath.row].name
        if indexPath.row > -1 && indexPath.row < 5 {
            let btnAImage = parkImageArray[indexPath.row]
            cell.parkSetImage.image = btnAImage
            cell.numberingImageView.image = parkNumberingArray?[indexPath.row]
        }
        return cell
    }
    
    /// handle when user select any of the park
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: "singleParkView") as! SingleParkViewController
        viewController.equipments = allParks[indexPath.row].facility
        viewController.name = allParks[indexPath.row].name
        viewController.userName = userName
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
