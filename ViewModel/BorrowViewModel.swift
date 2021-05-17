//
//  BorrowViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 27/03/2021.
//

import RxSwift
import RxCocoa

final class BorrowViewModel : NSObject {
    
    private let disposeBag = DisposeBag()
    
 var loan = BehaviorRelay<[Loan]>(value: [])
    
    
 override init() {
    
    loan.subscribe(onNext: { value in

    }).disposed(by: disposeBag)
    
    loan.accept(loan.value + CoreDataStack.getAllLoans(type: 0))
  }
    
    func deleteLoan(id: Int){
        CoreDataStack.deleteBy(Int64(id))
    }
}
