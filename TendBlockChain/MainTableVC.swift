//
//  ViewController.swift
//  SampleSearchDetails
//
//  Created by Doru Cojocaru on 23/08/2017.
//  Copyright © 2017 Doru Cojocaru. All rights reserved.
//

import UIKit


class MainTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]()
    var filteredNames = [String]()
    var selectedItem: String?
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        names = ["Ford", "Mercedes", "Fiat", "Opel", "KIA", "Suzuki", "Citroen", "BMW", "Audi"]
        
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.delegate = self
        filteredNames = names
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredNames.count
        }
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NameCell
        if isFiltering() {
            cell.nameLabel?.text = filteredNames[indexPath.row]
        } else {
            cell.nameLabel?.text = names[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = filteredNames[indexPath.row]
        performSegue(withIdentifier: "showDetailsIdentifier", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsIdentifier" {
            let destination = segue.destination as! ChooseDetailsTableVC
            destination.selectedItem = selectedItem
        }
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredNames = names.filter({ (name) -> Bool in
            return name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    
    @IBAction func unwindToMainTableVC(segue: UIStoryboardSegue) {
        
    }
}

extension MainTableVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension MainTableVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

