//
//  ViewController.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class AllEmployeesViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var employeesListTable: EmployeesListTableViewController?
    var filteredEmployees = [EmployeeEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "employeeList" {
            guard let embededVC = segue.destination as? EmployeesListTableViewController else { return }
            self.employeesListTable = embededVC
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredEmployees = fakeData.filter({( employee : EmployeeEntity) -> Bool in
            return employee.name.lowercased().contains(searchText.lowercased())
        })
        if searchText.isEmpty {
            employeesListTable?.filteredEmployees = nil
        } else {
            employeesListTable?.filteredEmployees = filteredEmployees
        }
        employeesListTable?.tableView.reloadData()
    }

}

extension AllEmployeesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension AllEmployeesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText)
    }
}
