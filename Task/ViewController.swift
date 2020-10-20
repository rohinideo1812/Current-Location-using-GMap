//
//  ViewController.swift
//  Task
//
//  Created by Rohini Deo on 20/10/20.
//  Copyright © 2020 Taxgenie. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isMyLocationEnabled = true
        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let camera = GMSCameraPosition.camera(withLatitude: (locations.last?.coordinate.latitude)!, longitude: (locations.last?.coordinate.longitude)!, zoom: 20.0)
        mapView.camera = camera
        
        // Creates a marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: (locations.last?.coordinate.latitude)!, longitude: (locations.last?.coordinate.longitude)!)
        marker.title = "Current Location"
        marker.map = mapView
        mapView.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
    }
}

