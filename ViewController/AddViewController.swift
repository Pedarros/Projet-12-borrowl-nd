//
//  AddViewController.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 11/04/2021.
//

import UIKit

import Foundation


class AddViewController : UIViewController {
    
    @IBOutlet weak var borrowOrLend: UISegmentedControl!
    
    @IBOutlet weak var objectName: UITextField!
    
    @IBOutlet weak var objectCategory: UIPickerView!
    
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var person: UITextField!
    
    
      let viewModel = AddViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
 
    func addLend() {
        var category = Category()
        var objectModel = ObjectModel(category: Category)
        var loan = Loan(name : objectName, status: (borrowOrLend != nil), date : dateObject,  )
        let dateObject = date.date
        let name = objectName.text
        
        viewModel.addloan(loan: loan)
    }
    
}

extension AddViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // addLend()
        textField.resignFirstResponder()
        return true
    }
    
}
