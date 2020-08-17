//
//  LocationTableViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 17/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController, NewLocationDelegate {

    // Farhad: this class will display our list of locations
    var mapViewController: MapViewController?
    var locationList = [LocationAnnotation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var location = LocationAnnotation(newTitle: "Monash Uni - Caulfield", newSubtitle: "The caulfield campus of the uni", lat: -37.877623, long: 145.045374)
        locationList.append(location)
        mapViewController?.mapView.addAnnotation(location)
        
        
        location = LocationAnnotation(newTitle: "Caulfield Near By park", newSubtitle: "nearby Park", lat: -37.8789, long: 145.0406)
        locationList.append(location)
        mapViewController?.mapView.addAnnotation(location)
    }
    
    func locationAnnotationAdded(annotation: LocationAnnotation) {
        locationList.append(annotation)
        mapViewController?.mapView.addAnnotation(annotation)
        tableView.insertRows(at: [IndexPath(row: locationList.count - 1, section: 0)], with: .automatic)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locationList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        let annotation = self.locationList[indexPath.row]
        
        cell.textLabel?.text = "Lat: \(annotation.coordinate.latitude) Long: \(annotation.coordinate.longitude)"


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mapViewController?.focusOn(annotation: self.locationList[indexPath.row])
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            locationList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addLocationSegue" {
            let controller = segue.destination as! NewLocationViewController
            controller.delegate = self
        }
     }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}
