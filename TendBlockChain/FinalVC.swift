//
//  FinalVC.swift
//  SampleSearchDetails
//
//  Created by Doru Cojocaru on 28/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit

class FinalVC: UITableViewController {
    var selectedItem: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = selectedItem
    }
}
