//
//  HomeViewController.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit

class HomeViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
//    var places: [Place] = Place.getDummyDatas()
    
    var image : [String] = 
    [   "samson", "samson", "samson"
        
    ]
    
    var name : [String] =
    [ "Sam Son", "Ha Noi", "HCM"
    
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCellContent()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    func setCellContent(){
        
        title = "WeTravel"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
}
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
                
//                let item = places[indexPath.row]
//                cell.nameLabel.text = item.name
//                cell.avatarImageView.image = UIImage(named: item.avatar)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 23
        cell.layer.borderColor = UIColor.black.cgColor
        cell.nameLabel.text = name[indexPath.row]
        cell.avatarImageView.image = UIImage(named: image[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10)/2
        
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailPlaceViewController") as! DetailPlaceViewController
        
        vc.detailImg = UIImage(named: image[indexPath.row])
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
