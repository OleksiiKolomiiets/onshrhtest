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
}

var fakeData: [EmployeeEntity] = [
    EmployeeEntity(name: "Leo Messi", position: "Forward", birthDay: Date(timeIntervalSince1970: 153725975)),
    EmployeeEntity(name: "Ivan Rakitic", position: "Midfilder", birthDay: Date(timeIntervalSince1970: 153725111)),
    EmployeeEntity(name: "Ter Shtegen", position: "Goalkeeper", birthDay: Date(timeIntervalSince1970: 153722375))
]
