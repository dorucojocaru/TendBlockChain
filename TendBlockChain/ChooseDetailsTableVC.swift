//
//  ChooseDetailsTableVC.swift
//  TendBlockChain
//
//  Created by Doru Cojocaru on 23/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit
import ImagePicker

class ChooseDetailsTableVC: UITableViewController {
    
    var selectedPhotos: [UIImage]?
    var selectedItem: String?
    var titlesAndValues: [[(String, String, String)]]?
    var row: Int?
    var section: Int?
    var blockSaleSwitch = "No"
    
    @IBAction func blockSaleChanged(_ sender: UISwitch) {
        blockSaleSwitch = sender.isOn.description
        if blockSaleSwitch == "true" {
            blockSaleSwitch = "Yes"
        } else {
            blockSaleSwitch = "No"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = selectedItem
        titlesAndValues = [ [("Photos", "", "Please add a photo"), ("Date", "", "Date of creation"), ("Location", "", "Please enter location"), ("Bought at", "", "BTC/token"), ("Last market sell price at", "", "BTC/token"), ("Your last sold price at", "", "BTC/token"), ("Your open sell price at", "", "BTC/token")],
                            [("Quantity", "", "Tokens"), ("Price", "", "Per Token"), ("Block Sale", "", "No"), ("Good Until", "", "Enter more details"), ("Estimated amount", "", "USD")],
                            [("", "", "")] ]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let imagePickerController = ImagePickerController()
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
            print("***Special imagePicker Launched*******")
        } else if indexPath.section == 0 && indexPath.row == 1 {
            performSegue(withIdentifier: "showYearPicker", sender: self)
        } else if indexPath.section == 0 && indexPath.row == 2 {
            performSegue(withIdentifier: "showLocationPicker", sender: self)
        } else if indexPath.section == 2{
            performSegue(withIdentifier: "showDetailsIdentifier", sender: self)
        } else if indexPath.section == 1 && indexPath.row == 3 {
            performSegue(withIdentifier: "showDatePicker", sender: self)
        } else if indexPath.section == 1 && indexPath.row == 2 {
            print("Block Sale Cell")
        } else {
            row = indexPath.row
            section = indexPath.section
            performSegue(withIdentifier: "showAmountSelector", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 && indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlockSaleCell") as! BlockSaleCell
            cell.blockSaleLabel.text = titlesAndValues![indexPath.section][indexPath.row].0
            return cell
        } else if indexPath.section == (titlesAndValues!.count - 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewButtonCell")
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TitleAndValueCell
            cell.titleLabel.text = titlesAndValues![indexPath.section][indexPath.row].0
            if titlesAndValues![indexPath.section][indexPath.row].1.isEmpty {
                cell.descriptionLabel.text = titlesAndValues![indexPath.section][indexPath.row].2
            } else {
                cell.descriptionLabel.text = titlesAndValues![indexPath.section][indexPath.row].1
                cell.descriptionLabel.textColor = UIColor(red: 0.06, green: 0.49, blue: 1.00, alpha: 1.0)
            }
            return cell
        }
    }
    
    @IBAction func unwindFromDatePickerVC(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    @IBAction func unwindFromNumberSelectVC(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    @IBAction func unwindFromLocationVC(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NumberSelectVC {
            destination.row = row
            destination.section = section
            destination.navBarTitle = titlesAndValues![section!][row!].0
            destination.units = titlesAndValues![section!][row!].2
        }
        
        if let destination = segue.destination as? PreviewTableVC {
            destination.photo = selectedPhotos?[0]
            destination.selectedItem = selectedItem
            titlesAndValues![1][2].1 = blockSaleSwitch
            destination.values = titlesAndValues
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return titlesAndValues!.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesAndValues![section].count
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}

extension ChooseDetailsTableVC: ImagePickerDelegate {
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        titlesAndValues?[0][0].1 = String(images.count)
        selectedPhotos = images
        imagePicker.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
