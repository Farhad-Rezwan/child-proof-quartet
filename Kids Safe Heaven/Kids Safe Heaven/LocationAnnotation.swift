//
//  LocationAnnotation.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 17/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import MapKit

class LocationAnnotation: NSObject, MKAnnotation {
    // it is a data class to store our location information, MK annotation allows easily to handle via mapkit
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(newTitle: String, newSubtitle: String, lat: Double, long: Double) {
        self.title = newTitle
        self.subtitle = newSubtitle
        coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }

}
