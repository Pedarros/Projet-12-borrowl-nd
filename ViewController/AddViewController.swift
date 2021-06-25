//
//  AddViewController.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 11/04/2021.
//

import UIKit

import Foundation


class AddViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var borrowOrLend: UISegmentedControl!
    
    @IBOutlet weak var objectName: UITextField!
    
    @IBOutlet weak var objectCategory: UIPickerView!
    
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var person: UITextField!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var type = 0
    var selectedCategory : Category?
    var mydate = ""
    
    
    @IBAction func sgmentedcontrolAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
               print("Prêt")
            type = 0
           }

           if sender.selectedSegmentIndex == 1 {
               print("Emprunt ")
             type = 1
           }
    }
    @IBAction func cancelButton(_ sender: Any) {
        
        //cancel
    }
    
    @IBAction func addButton(_ sender: Any) {
        addLend()
        self.dismiss(animated: true, completion: nil)
    }
    
      let viewModel = AddViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectCategory.delegate = self
        objectCategory.dataSource = self
        person.delegate = self
        objectName.delegate = self
       
    }
    
    @IBAction func datechanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMM dd, YYYY"
        mydate = dateFormatter.string(from: sender.date)
    }
    
    func addLend() {
        
        let category = Category(name: selectedCategory?.name, image: selectedCategory?.image)
        
        let objectModel = ObjectModel(name: objectName.text,category: category)

        let loan = Loan(id: 0, name: person.text, date: mydate, type: Int16(type), myObject: objectModel, status: false)
        
        viewModel.addloan(loan: loan)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return viewModel.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String? {
        return viewModel.categories[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = viewModel.categories[row]
    }
}

extension AddViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        textField.resignFirstResponder()
        return true
    }
    
}
