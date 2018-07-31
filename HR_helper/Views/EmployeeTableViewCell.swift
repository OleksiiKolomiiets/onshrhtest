//
//  EmployeeTableViewCell.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with model: EmployeeEntity) {
        nameLabel.text = model.name
        positionLabel.text = model.position
        if let image = model.avatar?.image {
            avatarImage.image = image
            avatarView.backgroundColor = .clear
        }
    }
}
