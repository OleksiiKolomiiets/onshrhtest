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
}

var fakeData: [EmployeeEntity] = [
    EmployeeEntity(name: "Leo Messi", position: "Forward", birthDay: Date(timeIntervalSince1970: TimeInterval(153725975)), avatar: AvatarManager(with: #imageLiteral(resourceName: "Image")) ),
    EmployeeEntity(name: "Ivan Rakitic", position: "Midfilder", birthDay: Date(timeIntervalSince1970: TimeInterval(253725111)), avatar: nil),
    EmployeeEntity(name: "Ter Shtegen", position: "Goalkeeper", birthDay: Date(timeIntervalSince1970: TimeInterval(353722375)), avatar: AvatarManager(with: #imageLiteral(resourceName: "iconHarry")))
]


