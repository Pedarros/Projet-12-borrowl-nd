//
//  InformationTableViewCell.swift
//  Borrowlænd
//
//  Created by Emile Pedarros on 25/02/2021.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var object: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
