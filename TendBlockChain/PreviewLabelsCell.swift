//
//  PreviewLabelsCell.swift
//  SampleSearchDetails
//
//  Created by Doru Cojocaru on 25/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit

class PreviewLabelsCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
