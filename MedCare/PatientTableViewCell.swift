//
//  PatientTableViewCell.swift
//  MedCare
//
//  Created by Priscilla Ikhena on 15/04/2019.
//  Copyright © 2019 Priscilla Ikhena. All rights reserved.
//

import UIKit

class PatientTableViewCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
