//
//  DetailPlaceViewController.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit

class DetailPlaceViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailPlace: UITextView!
    
    var detailImg: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = detailImg
        
    }
    
    @IBAction func searchLocation(_ sender: Any) {
        let vc = MapViewController()
        present(vc, animated: true)
    }
    
    

}
