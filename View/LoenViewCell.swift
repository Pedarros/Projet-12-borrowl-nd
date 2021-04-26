//
//  LoenViewCell.swift
//  Borrowlaend
//
//  Created by Brahim on 31/03/2021.
//

import UIKit

class LoenViewCell: UITableViewCell {
    
    static var Identifier = "LoenViewCell"
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

     var borrow: Loan? {
        didSet {
          guard let borrow = borrow else { return }
            firstNameLabel.text = borrow.name
          
        }
    }

    
}
