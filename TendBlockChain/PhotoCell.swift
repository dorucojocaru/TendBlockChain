//
//  PhotoCell.swift
//  SampleSearchDetails
//
//  Created by Doru Cojocaru on 25/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
