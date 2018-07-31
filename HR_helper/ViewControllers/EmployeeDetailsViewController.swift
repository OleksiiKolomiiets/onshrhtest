//
//  EmployeeDetailsViewController.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var containerForAvatarImage: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var employeeModel: EmployeeEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let model = employeeModel else { return }
        configure(with: model)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configure(with model: EmployeeEntity) {
        nameLabel.text = model.name
        positionLabel.text = model.position
        let date = DateManager(date: model.birthDay, datePattern: .byDefault)
        birthdayLabel.text = date?.resultString
    }

}
