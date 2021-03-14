//
//  LendController.swift
//  Borrowlænd
//
//  Created by Emile Pedarros on 30/01/2021.
//

import Foundation
import UIKit

class LendController {
    
    @IBOutlet weak var lendViewController: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
    lendViewController.register(UINib(nibName: "InformationTableViewCell", bundle: nil),
    forCellReuseIdentifier: "InformationTableViewCell")
    }
    
}
