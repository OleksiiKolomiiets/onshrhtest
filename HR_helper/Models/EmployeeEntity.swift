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





