//
//  BorrowViewController.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 11/04/2021.
//
import UIKit
import RxCocoa
import RxSwift
import Foundation

class BorrowViewController : UITableViewController {
    
    @IBOutlet var borrowTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBAction func addButtonAction(_ sender: Any) {
    
    }
    
    
    private let disposeBag = DisposeBag()
    
      let viewModel = LendViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        configureTableView()
        
        bind()
        
    }
    
    private func registerCell() {
        let nib = UINib(nibName: LoenViewCell.Identifier, bundle: nil)
       tableView.register(nib, forCellReuseIdentifier: LoenViewCell.Identifier)
     }
    
     private func configureTableView() {
       registerCell()
       tableView.rowHeight = 90
     }
    
    private func bind() {
        viewModel.loan.asObservable()
         .bind(to: tableView.rx.items(cellIdentifier: LoenViewCell.Identifier, cellType: LoenViewCell.self))                           {
         row, borrow, cell in
           cell.borrow = borrow
        }.disposed(by: disposeBag)
      }
    
    func borrowTableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func borrowTableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            borrowTableView.beginUpdates()
            borrowTableView.deleteRows(at: [indexPath], with: .automatic)
            borrowTableView.endUpdates()
        }
    }
    
}
