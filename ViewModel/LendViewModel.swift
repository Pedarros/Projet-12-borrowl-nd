//
//  LendViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 24/04/2021.
//

import Foundation

import RxSwift
import RxCocoa

final class LendViewModel : NSObject {
    
    private let disposeBag = DisposeBag()
    
 var loan = BehaviorRelay<[Loan]>(value: [])
    
    
 override init() {
    
    loan.subscribe(onNext: { value in

    }).disposed(by: disposeBag)
    
    loan.accept(loan.value + CoreDataStack.getAllLoans())
  }
    
    func deleteLoan(id: Int){
        CoreDataStack.deleteBy(Int64(id))
    }
   
    func addloan(loan: Loan, idCategory: Int){
        CoreDataStack.addLoan(loan, catory: Int64(idCategory))
    }
    
}
