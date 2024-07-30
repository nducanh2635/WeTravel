//
//  MapViewController.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit
import MapKit
import GooglePlaces

class MapViewController: UIViewController, UISearchResultsUpdating {
    
    var location: String?
    
    let mapView = MKMapView()
    
    let search = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        view.addSubview(mapView)
        search.searchBar.backgroundColor = .systemBackground
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = CGRect(x: 0, y: view.safeAreaInsets.top - 10,
                               width: view.frame.size.width,
                               height: view.frame.size.height - view.safeAreaInsets.top)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
        let resultVC = searchController.searchResultsController as? ResultsViewController else {
            return
            }
        
        GooglePlacesManager.shared.findPlaces(query: query){ result in
            switch result {
            case .success(let places):
                DispatchQueue.main.async {
                    resultVC.update(with: places)
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}

