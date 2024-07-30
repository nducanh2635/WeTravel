//
//  MapViewController.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var searchMap: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let options = GMSMapViewOptions()
        options.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        options.frame = self.view.bounds

        let mapView = GMSMapView(options: options)
        self.view.addSubview(mapView)

        self.addMarker()
    }
    
    func addMarker() {
             let marker = GMSMarker()
             marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
             marker.title = "Hanoi"
             marker.snippet = "Vietnam"
             marker.map = self.mapView
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
}

