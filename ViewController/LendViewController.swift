//
//  LendViewController.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 11/04/2021.
//
import UIKit
import Foundation

final class LendViewController : UIViewController {
    
    @IBOutlet weak var lendTableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lendTableView.delegate = self
        lendTableView.dataSource = self
        
        lendTableView.register(UINib(nibName: "LoenViewCell", bundle: nil),
                               forCellReuseIdentifier: "LoenViewCell")
    }
    
}
