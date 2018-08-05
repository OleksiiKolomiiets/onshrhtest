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
    var addEmployeeViewController: AddEmployeeViewController?
    var filteredEmployees = [EmployeeEntity]()
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEmployeeViewController?.dataSource = dataSource
        searchBar.delegate = self
    }
    @IBAction func tappedAddButton(_ sender: UIBarButtonItem) {
        guard let pushedVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: AddEmployeeViewController.reuseIdentifier) as? AddEmployeeViewController else { return }
        pushedVC.dataSource = dataSource
        self.navigationController?.pushViewController(pushedVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "employeeList" {
            guard let embededVC = segue.destination as? EmployeesListTableViewController else { return }
            embededVC.delegate = self
            self.employeesListTable = embededVC
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredEmployees = dataSource.getAll().filter({( employee : EmployeeEntity) -> Bool in
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
