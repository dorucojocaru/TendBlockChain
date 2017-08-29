//
//  PreviewTableVC.swift
//  TendBlockChain
//
//  Created by Doru Cojocaru on 25/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit

class PreviewTableVC: UITableViewController {
    
    var photo: UIImage?
    var values: [[(String, String, String)]]?
    var valuesArray: [String]?
    var selectedItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        values![0].insert(("","", ""), at: 0)
        navigationItem.title = "Preview"
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
            cell.photo.image = photo
            return cell
        } else if indexPath.row == 1 && indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PreviewLabelsCell
            cell.titleLabel.text = selectedItem
            cell.descriptionLabel.text = ""
            return cell
        }
        else if indexPath.section == (values!.count - 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AcknowledgeButtonCell")
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PreviewLabelsCell
            cell.titleLabel.text = values?[indexPath.section][indexPath.row].0
            cell.descriptionLabel.text = values?[indexPath.section][indexPath.row].1
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 375
        } else {
            return 44
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return values!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values![section].count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FinalVC {
            destination.selectedItem = selectedItem
        }
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
