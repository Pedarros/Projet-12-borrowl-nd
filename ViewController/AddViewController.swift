//
//  AddViewController.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 11/04/2021.
//

import UIKit

import Foundation


import UIKit


class AddViewController : UIViewController {
    
    @IBOutlet weak var borrowOrLend: UISegmentedControl!
    
    @IBOutlet weak var objectName: UITextField!
    
    @IBOutlet weak var objectCategory: UIPickerView!
    
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var person: UITextField!
    
    
      let viewModel = BorrowViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
}
