//
//  HomeViewController.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, NSFetchedResultsControllerDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var fetchedResultsController: NSFetchedResultsController<PlaceDetail>!
    
    var image : [String] = 
    [   "samson", "catba", "cotco",
        "hagiang", "halong", "hoguom",
        "phuyen", "tayninh", "trangan",
        "vanmieu"
    ]
    
    var name : [String] =
    [ "Sầm Sơn", "Cát Bà", "Cột cờ Hà Nội",
      "Hà Giang", "Hạ Long", "Hồ Gươm",
      "Phú Yên", "Tây Ninh", "Tràng An",
      "Văn Miếu"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCellContent()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        setupData()
        
        
    }
    func setupData(){
        save(name: "Sầm Sơn", detail: "Biển", image: "samson")
        initializeFetchedResultsController()
    }
    
    func setCellContent(){
        
        title = "WeTravel"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    func initializeFetchedResultsController() {
        
        let fetchRequest: NSFetchRequest<PlaceDetail> = PlaceDetail.fetchRequest()

        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
        let managedContext = appDelegate.persistentContainer.viewContext
            
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                              managedObjectContext: managedContext,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)

        fetchedResultsController.delegate = self
            
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
    
    func save(name: String, detail: String, image: String) {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "PlaceDetail", in: managedContext)!
            
            let place = NSManagedObject(entity: entity, insertInto: managedContext)
            
            place.setValue(name, forKeyPath: "name")
            place.setValue(detail, forKeyPath: "detail")
            place.setValue(image, forKeyPath: "image")
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
    }
    
}
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fetchedResultsController.fetchedObjects!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell

        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 23
        cell.layer.borderColor = UIColor.black.cgColor
        
        let place = fetchedResultsController.object(at: indexPath)
        
        cell.nameLabel.text = place.name
        cell.avatarImageView.image = UIImage(named: place.image!)
        
//        cell.nameLabel.text = name[indexPath.row]
//        cell.avatarImageView.image = UIImage(named: image[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10)/2
        
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailPlaceViewController") as! DetailPlaceViewController
        let place = fetchedResultsController.object(at: indexPath)
        vc.detailImg = UIImage(named: image[indexPath.row])
        vc.detailPlc = place.detail
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
