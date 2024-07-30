//
//  ProfileViewController.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit

class ProfileViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    let profileCells = ProfileCell.profileCells
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellContent()
        avatarImage.makeRounded()
    }
    
    func setCellContent(){
        title = "Profile"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 90.0
        tableView.rowHeight = tableView.estimatedRowHeight
//      tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
    }
    
    
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableViewCell
        else {return UITableViewCell()}
        
        let content = profileCells[indexPath.row]
        cell.binding(data: content)
        
        return cell
    }
    
}

extension UIImageView {
    
    func makeRounded() {
        
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}

