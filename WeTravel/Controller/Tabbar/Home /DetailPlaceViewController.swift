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
    var detailPlc: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = detailImg
        detailPlace.text = detailPlc
        
    }
    
    @IBAction func searchLocation(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        vc.location = detailPlc
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    

}
