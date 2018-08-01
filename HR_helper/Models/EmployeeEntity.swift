//
//  EmployeeEntity.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct EmployeeEntity {
    var name: String
    var position: String
    var birthDay: Date
    var avatar: AvatarManager?
    
    mutating func setUniqName() {
        var newLastCharacter = "1"
        if let lastCharacter = name.last, let number = Int(String(lastCharacter)) {
            let newNumber = number + 1
            newLastCharacter = String(newNumber)
        }
        name = name + newLastCharacter
    }
}

extension EmployeeEntity: Equatable {
    static func == (lhs: EmployeeEntity, rhs: EmployeeEntity) -> Bool {
        return lhs.name == rhs.name
    }
}

extension EmployeeEntity: Hashable {
    var hashValue: Int {
        return name.hashValue
    }
}

var fakeData: [EmployeeEntity] = [
    EmployeeEntity(name: "Leo Messi", position: "Forward", birthDay: Date(timeIntervalSince1970: TimeInterval(153725975)), avatar: AvatarManager(with: #imageLiteral(resourceName: "Image")) ),
    EmployeeEntity(name: "Ivan Rakitic", position: "Midfilder", birthDay: Date(timeIntervalSince1970: TimeInterval(253725111)), avatar: nil),
    EmployeeEntity(name: "Ter Shtegen", position: "Goalkeeper", birthDay: Date(timeIntervalSince1970: TimeInterval(353722375)), avatar: AvatarManager(with: #imageLiteral(resourceName: "iconHarry")))
]

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


