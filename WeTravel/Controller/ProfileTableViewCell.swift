//
//  ProfileTableViewCell.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func binding(data profile: Profile){
        self.name.text = profile.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
