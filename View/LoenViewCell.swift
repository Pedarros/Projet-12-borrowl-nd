//
//  LoenViewCell.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 11/04/2021.
//

import UIKit

class LoenViewCell: UITableViewCell {
    
    static var Identifier = "LoenViewCell"
    
    @IBOutlet weak var objectName: UILabel!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var objectCategoryImage: UIImageView!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    
     var borrow: Loan? {
        
        
        didSet {
          guard let borrow = borrow else { return }
            objectName.text = borrow.myObject?.name
            personName.text = borrow.name
            objectCategoryImage.image = UIImage(named: (borrow.myObject?.category.name) ?? "book")
          
          
        }
    }

    
}

