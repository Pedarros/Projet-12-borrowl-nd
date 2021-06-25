//
//  LoanViewController.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 31/03/2021.
//

import UIKit
import RxCocoa
import RxSwift

class LoanViewController: UITableViewController {

    @IBOutlet var mTableView: UITableView!
    private let disposeBag = DisposeBag()
    
      let viewModel = BorrowViewModel()
    
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
    
}
