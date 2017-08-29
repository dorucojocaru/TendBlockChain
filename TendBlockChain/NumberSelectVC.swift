//
//  NumberSelectVC.swift
//  SampleSearchDetails
//
//  Created by Doru Cojocaru on 24/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit

class NumberSelectVC: UIViewController {
    
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var tagToCheck = Int()
    var row: Int?
    var section: Int?
    var navBarTitle: String?
    var units: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unitsLabel.text = units
        descriptionLabel.text = "Cell description which explains the consequences of the above action."
        
        navigationItem.hidesBackButton = false
        navigationItem.title = navBarTitle
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ChooseDetailsTableVC
        if let number = textField.text {
            destination.titlesAndValues![section!][row!].1 = number
            }
        }
    }

