//
//  EmployeeCell.swift
//  AvitoTechIOS
//
//  Created by tasya on 08.09.2021.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with model: Employee, indexPath: IndexPath){
        nameLabel.text = model.name
        phoneNumberLabel.text = model.phoneNumber
        skillsLabel.text = model.skills.joined(separator: ", ")
    }
}
