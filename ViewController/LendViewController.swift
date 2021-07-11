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

class LendViewController : UITableViewController {
    
    @IBOutlet var lendTableView: UITableView!
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
        delete()
    }
    
    override func viewWillAppear(_ animated: Bool) {
          viewModel.loadData.subscribe().disposed(by: disposeBag)
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
    
    private  func delete() {
        lendTableView.rx.itemDeleted
            .subscribe{
                print("\($0)")
                
                self.viewModel.deleteLoan(id: 0)
            }
            .disposed(by: disposeBag)
            
    }
   
    
}
