//
//  DatePickerVC.swift
//  TendBlockChain
//
//  Created by Doru Cojocaru on 24/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var pickedDate: Date!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ChooseDetailsTableVC
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        destination.titlesAndValues![1][3].1 = formatter.string(from: pickedDate!)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        pickedDate = datePicker.date
    }
}


