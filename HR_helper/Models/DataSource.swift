//
//  DataSource.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 8/6/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DataSource {
    
    private var employees: Set<EmployeeEntity> = [
        EmployeeEntity(name: "Leo Messi", position: "Forward", birthDay: Date(timeIntervalSince1970: TimeInterval(153725975)), avatar: AvatarManager(with: #imageLiteral(resourceName: "Image")) ),
        EmployeeEntity(name: "Ivan Rakitic", position: "Midfilder", birthDay: Date(timeIntervalSince1970: TimeInterval(253725111)), avatar: nil),
        EmployeeEntity(name: "Ter Shtegen", position: "Goalkeeper", birthDay: Date(timeIntervalSince1970: TimeInterval(353722375)), avatar: AvatarManager(with: #imageLiteral(resourceName: "iconHarry")))
    ]
    
    var count: Int {
        return employees.count
    }
    
    func getAll() -> Set<EmployeeEntity> {
        return employees
    }
    
    func add(_ employee: EmployeeEntity) {
        var trmporaryEmployee = employee
        if employees.contains(employee) {
            trmporaryEmployee.setUniqName()
        }
        employees.insert(trmporaryEmployee)
    }
    
    func delete(_ employee: EmployeeEntity) {
        employees.remove(employee)
    }
    
    subscript(index: Int) -> EmployeeEntity {
        let i =  employees.index(employees.startIndex, offsetBy: index)
        return employees[i]
    }
}
