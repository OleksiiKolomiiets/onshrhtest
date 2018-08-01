//
//  EmployeesListTableViewController.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class EmployeesListTableViewController: UITableViewController {
    
    var filteredEmployees: [EmployeeEntity]?
    var delegate: AllEmployeesViewController?
    var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = DataSource()
        delegate?.dataSource = dataSource
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let filteredEmployees = filteredEmployees {
            return filteredEmployees.count
        } else {
            return dataSource.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.reuseIdentifier, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
        var model: EmployeeEntity
        if let filteredEmployees = filteredEmployees {
            model = filteredEmployees[indexPath.row]
        } else {
            model = dataSource[indexPath.row]
        }
        cell.configure(with: model)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let embededVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: EmployeeDetailsViewController.reuseIdentifier) as? EmployeeDetailsViewController else { return }
        embededVC.dataSource = dataSource
        embededVC.employeeModel = dataSource[indexPath.row]
        embededVC.employeeIdentifier = indexPath.row
        self.navigationController?.pushViewController(embededVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            dataSource.delete(dataSource[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    

}
