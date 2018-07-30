//
//  EmployeesListTableViewController.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class EmployeesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = fakeData.count
        return numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.reuseIdentifier, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
        cell.configure(with: fakeData[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let embededVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: EmployeeDetailsViewController.reuseIdentifier) as? EmployeeDetailsViewController else { return }
        self.navigationController?.pushViewController(embededVC, animated: true)
    }

}
