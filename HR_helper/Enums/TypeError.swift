//
//  TypeError.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

enum TypeError: Error {
    case dataIsAbsent
    case imageInvalid
    case deniedPermission

    var localizedDescription: String {
        switch self {
        case .dataIsAbsent:
            return "Data exists"        
        case .imageInvalid:
            return "Image is invalid"
        case .deniedPermission:
            return "You can't change the avatar, if you don't let use your image library"
        }
    }
}
