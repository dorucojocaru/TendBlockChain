//
//  YearPickerVC.swift
//  TendBlockChain
//
//  Created by Doru Cojocaru on 23/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit

class YearPickerVC: UIViewController {
    
    @IBOutlet weak var yearPicker: UIPickerView!
    
    var pickerData: [Int] = [Int]()
    var pickedYear: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearPicker.delegate = self
        yearPicker.dataSource = self
        pickerData = [Int](1900...2020)
        navigationItem.hidesBackButton = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ChooseDetailsTableVC
        destination.titlesAndValues![0][1].1 = pickedYear
    }
}

extension YearPickerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickedYear = String(pickerData[row])
        return pickedYear
    }
}
