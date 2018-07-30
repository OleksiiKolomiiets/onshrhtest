//
//  ViewControllerExtension.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true, completion: nil)
    }
}
