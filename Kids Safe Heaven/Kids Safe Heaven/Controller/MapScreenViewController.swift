//
//  MapScreenViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 18/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapScreenViewController: UIViewController {


    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let toZoomIn: Double = 10000
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: toZoomIn, longitudinalMeters: toZoomIn)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()

        // Do any additional setup after loading the view.
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
            // setup our locaiton manager
        } else {
            // show allert letting the user know that they have to turn location service on
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            print("Location Accessed")
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            // Do map stuff
            break
        case .denied:
            // pop up alert instructing them how to turn on permission
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            // show an alert letting them know what is going on
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    


}



extension MapScreenViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // will be back, when user change the lcoation
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: toZoomIn, longitudinalMeters: toZoomIn)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // will be back when user change the authorization
        // whenever it changes make sure that we run the switch statement,
        checkLocationAuthorization()
    }

}
